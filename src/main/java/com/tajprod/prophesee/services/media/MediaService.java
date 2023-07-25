package com.tajprod.prophesee.services.media;

import com.tajprod.prophesee.models.media.Media;
import com.tajprod.prophesee.repositories.media.MediaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MediaService {
  @Autowired
  private MediaRepository mediaRepository;

  public List<Media> findAllMedia() {
    return mediaRepository.findAll();
  }

  public Media createNewMedia(Media media) {
    return mediaRepository.save(media);
  }
}