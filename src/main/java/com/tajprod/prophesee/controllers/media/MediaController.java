package com.tajprod.prophesee.controllers.media;

import com.tajprod.prophesee.models.media.Media;
import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.models.user.User;
import com.tajprod.prophesee.models.watchlist.Watchlist;
import com.tajprod.prophesee.services.media.MediaService;
import com.tajprod.prophesee.services.platform.PlatformService;
import com.tajprod.prophesee.services.user.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.UUID;

@SuppressWarnings("DuplicatedCode")
@Controller
public class MediaController {
  @Autowired
  private UserService userService;

  @Autowired
  private PlatformService platformService;

  @Autowired
  private MediaService mediaService;

  //  =============== GET ROUTES ===============

  @GetMapping("/watchlist/media/add")
  public String displayNewMediaForm(
    @ModelAttribute("media") Media media,
    HttpSession session,
    Model model
  ) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }

    UUID userId = (UUID) session.getAttribute("userId");
    if (!userService.isValidId(userId)) {
      return "redirect:/logout";
    }
    model.addAttribute("userId", userId);

    User user = userService.getUserById(userId);
    model.addAttribute("platforms", user.getWatchlist().getPlatforms());

    // TODO: Media form jsp
    return "media/mediaForm.jsp";
  }

  //  =============== POST ROUTES ===============

  @PostMapping("/watchlist/quick-add/new")
  public String quickAddCreateNewMedia(
    @Valid @ModelAttribute("media") Media media,
    BindingResult result,
    HttpSession session,
    Model model
  ) {
    UUID userId = (UUID) session.getAttribute("userId");

    if (result.hasErrors()) {
      model.addAttribute("media", media);

      User user = userService.getUserById(userId);
      model.addAttribute("username", user.getUsername());
      Watchlist watchlist = user.getWatchlist();
      model.addAttribute("platforms", watchlist.getPlatforms());

      return "main/dashboard.jsp";
    }
    Media newMedia = mediaService.createNewMedia(media);

    Platform platform = newMedia.getPlatform();
    platformService.addNewMediaToPlatform(platform, media);

    return String.format("redirect:/watchlist/media/%d/view", newMedia.getId());
  }

  //  =============== PUT ROUTES ===============

  //  =============== DELETE ROUTES ===============
}