package com.tajprod.prophesee.models.platform;

import com.tajprod.prophesee.models.media.Media;
import com.tajprod.prophesee.models.watchlist.Watchlist;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.List;

@Entity
@Table(name = "platforms")
public class Platform {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;

  @NotBlank(message = "Platform name is required")
  @Size(min = 2, max = 30, message = "Platform name must be between 2 and 30 characters")
  private String name;

  private String siteUrl;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "watchlist_id")
  private Watchlist watchlist;

  @OneToMany(mappedBy = "platform", fetch = FetchType.LAZY)
  private List<Media> mediaList;

  public Platform() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getSiteUrl() {
    return siteUrl;
  }

  public void setSiteUrl(String siteUrl) {
    this.siteUrl = siteUrl;
  }

  public Watchlist getWatchlist() {
    return watchlist;
  }

  public void setWatchlist(Watchlist watchlist) {
    this.watchlist = watchlist;
  }

  public List<Media> getMediaList() {
    return mediaList;
  }

  public void setMediaList(List<Media> mediaList) {
    this.mediaList = mediaList;
  }
}