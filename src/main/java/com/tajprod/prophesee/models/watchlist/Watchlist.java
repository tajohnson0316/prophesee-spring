package com.tajprod.prophesee.models.watchlist;

import com.tajprod.prophesee.models.platform.Platform;
import com.tajprod.prophesee.models.user.User;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "watchlists")
public class Watchlist {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id")
  private User user;

  @OneToMany(mappedBy = "watchlist", fetch = FetchType.LAZY)
  private List<Platform> platforms;

  public Watchlist() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public List<Platform> getPlatforms() {
    return platforms;
  }

  public void setPlatforms(List<Platform> platforms) {
    this.platforms = platforms;
  }
}