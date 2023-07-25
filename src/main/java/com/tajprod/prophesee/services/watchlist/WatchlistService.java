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
    watchlist.setPlatforms(new ArrayList<>());

    return watchlistRepository.save(watchlist);
  }

  public void createDefaultPlatform(Watchlist watchlist) {
    Platform unlistedPlatform = new Platform();
    unlistedPlatform.setName("Unlisted");
    unlistedPlatform.setWatchlist(watchlist);
    watchlist.getPlatforms().add(platformService.updatePlatform(unlistedPlatform));
  }

  public Watchlist addNewPlatformToWatchlist(Watchlist watchlist, Platform platform) {
    platform.setWatchlist(watchlist);
    platformService.updatePlatform(platform);

    watchlist.getPlatforms().add(platform);

    return updateWatchlist(watchlist);
  }

  public Watchlist updateWatchlist(Watchlist watchlist) {
    return watchlistRepository.save(watchlist);
  }
}