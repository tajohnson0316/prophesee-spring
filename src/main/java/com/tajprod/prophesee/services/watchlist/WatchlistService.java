package com.tajprod.prophesee.services.watchlist;

import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.models.watchlist.Watchlist;
import com.tajprod.prophesee.repositories.watchlist.WatchlistRepository;
import com.tajprod.prophesee.services.platform.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class WatchlistService {
  @Autowired
  private WatchlistRepository watchlistRepository;

  @Autowired
  private PlatformService platformService;

  public List<Watchlist> findAll() {
    return watchlistRepository.findAll();
  }

  public Watchlist findWatchlistById(Long id) {
    Optional<Watchlist> optional = watchlistRepository.findById(id);

    return optional.orElse(null);
  }

  public Watchlist createNewWatchlist(Watchlist watchlist) {
    // Instantiate the default "Unlisted" platform and add it to the watchlist's platform list
    Platform defaultPlatform = platformService.savePlatform(new Platform());
    defaultPlatform.setName("Unlisted");
    defaultPlatform.setWatchlist(watchlist);
    platformService.savePlatform(defaultPlatform);

    watchlist.setPlatforms(new ArrayList<>());
    watchlist.getPlatforms().add(defaultPlatform);

    return watchlistRepository.save(watchlist);
  }

  public Watchlist addPlatformToWatchlist(Watchlist watchlist, Platform platform) {
    platform.setWatchlist(watchlist);
    platformService.savePlatform(platform);

    watchlist.getPlatforms().add(platform);

    return updateWatchlist(watchlist);
  }

  public Watchlist updateWatchlist(Watchlist watchlist) {
    return watchlistRepository.save(watchlist);
  }
}