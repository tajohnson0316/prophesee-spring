package com.tajprod.prophesee.repositories.watchlist;

import com.tajprod.prophesee.models.watchlist.Watchlist;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WatchlistRepository extends CrudRepository<Watchlist, Long> {
  @NotNull
  List<Watchlist> findAll();
}