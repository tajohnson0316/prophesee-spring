package com.tajprod.prophesee.repositories.media;

import com.tajprod.prophesee.models.media.Media;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MediaRepository extends CrudRepository<Media, Long> {
  @NotNull
  List<Media> findAll();
}