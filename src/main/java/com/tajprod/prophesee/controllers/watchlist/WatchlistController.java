package com.tajprod.prophesee.controllers.watchlist;

import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.models.user.User;
import com.tajprod.prophesee.models.watchlist.Watchlist;
import com.tajprod.prophesee.services.user.UserService;
import com.tajprod.prophesee.services.watchlist.WatchlistService;
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

@Controller
public class WatchlistController {
  @Autowired
  private UserService userService;

  @Autowired
  private WatchlistService watchlistService;

  //  =============== GET ROUTES ===============

  @GetMapping("/dashboard")
  public String dashboard(Model model, HttpSession session) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }

    UUID userId = (UUID) session.getAttribute("userId");
    if (!userService.isValidId(userId)) {
      return "redirect:/logout";
    }

    User user = userService.getUserById(userId);
    model.addAttribute("username", user.getUsername());
    Watchlist watchlist = user.getWatchlist();
    model.addAttribute("platforms", watchlist.getPlatforms());

    return "main/dashboard.jsp";
  }

  //  =============== POST ROUTES ===============

  @PostMapping
  public String createNewPlatform(
    @Valid @ModelAttribute("platform") Platform platform,
    BindingResult result,
    HttpSession session,
    Model model
  ) {
    // TODO:
    return null;
  }

  //  =============== PUT ROUTES ===============

  //  =============== DELETE ROUTES ===============
}