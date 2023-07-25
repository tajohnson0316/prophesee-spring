package com.tajprod.prophesee.repositories.platform;

import com.tajprod.prophesee.models.platform.Platform;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlatformRepository extends CrudRepository<Platform, Long> {
  List<Platform> findAllByWatchlist_Id(Long watchlistId);
}