package com.tajprod.prophesee.services.platform;

import com.tajprod.prophesee.models.media.Media;
import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.repositories.platform.PlatformRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PlatformService {
  @Autowired
  private PlatformRepository platformRepository;

  public Platform findPlatformById(Long id) {
    Optional<Platform> optional = platformRepository.findById(id);

    return optional.orElse(null);
  }

  public List<Platform> findAllByWatchlistId(Long watchlistId) {
    return platformRepository.findAllByWatchlist_Id(watchlistId);
  }

  public Platform createNewPlatform(Platform platform) {
    platform.setMediaList(new ArrayList<>());

    return platformRepository.save(platform);
  }

  public Platform updatePlatform(Platform platform) {
    return platformRepository.save(platform);
  }

  public void addNewMediaToPlatform(Platform platform, Media media) {
    platform.getMediaList().add(media);

    platformRepository.save(platform);
  }
}