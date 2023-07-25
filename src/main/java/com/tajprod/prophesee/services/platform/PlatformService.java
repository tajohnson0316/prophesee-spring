package com.tajprod.prophesee.services.platform;

import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.repositories.platform.PlatformRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlatformService {
  @Autowired
  private PlatformRepository platformRepository;

  public List<Platform> findAllByWatchlistId(Long watchlistId) {
    return platformRepository.findAllByWatchlist_Id(watchlistId);
  }

  public Platform savePlatform(Platform platform) {
    return platformRepository.save(platform);
  }
}