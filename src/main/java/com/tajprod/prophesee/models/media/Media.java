package com.tajprod.prophesee.models.media;

import com.tajprod.prophesee.models.platform.Platform;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "media")
public class Media {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotBlank(message = "Media title is required")
  @Size(max = 72, message = "Media title cannot exceed 72 characters")
  private String title;

  @NotBlank(message = "Media category is required")
  private String category;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "platform_id")
  private Platform platform;

  private boolean isWatching;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date startDate;

  private boolean finishedWatching;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date finishDate;

  private boolean isAiring;

  private Integer totalSeasons;

  private String notes;

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  public Media() {
  }

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public Platform getPlatform() {
    return platform;
  }

  public void setPlatform(Platform platform) {
    this.platform = platform;
  }

  public Boolean getWatching() {
    return isWatching;
  }

  public void setWatching(Boolean watching) {
    isWatching = watching;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Boolean getFinishedWatching() {
    return finishedWatching;
  }

  public void setFinishedWatching(Boolean finishedWatching) {
    this.finishedWatching = finishedWatching;
  }

  public Date getFinishDate() {
    return finishDate;
  }

  public void setFinishDate(Date finishDate) {
    this.finishDate = finishDate;
  }

  public Boolean getAiring() {
    return isAiring;
  }

  public void setAiring(Boolean airing) {
    isAiring = airing;
  }

  public Integer getTotalSeasons() {
    return totalSeasons;
  }

  public void setTotalSeasons(Integer totalSeasons) {
    this.totalSeasons = totalSeasons;
  }

  public String getNotes() {
    return notes;
  }

  public void setNotes(String notes) {
    this.notes = notes;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }
}