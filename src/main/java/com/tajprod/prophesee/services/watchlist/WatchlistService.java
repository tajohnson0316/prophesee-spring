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
    // Instantiate the default miscellaneous platform and add it to the watchlist's list of platforms
    Platform miscellaneousPlatform = platformService.createNewPlatform(new Platform());
    miscellaneousPlatform.setWatchlist(watchlist);

    watchlist.setPlatforms(new ArrayList<>());
    watchlist.getPlatforms().add(miscellaneousPlatform);

    return watchlistRepository.save(watchlist);
  }
}