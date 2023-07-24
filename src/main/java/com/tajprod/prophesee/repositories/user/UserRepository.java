package com.tajprod.prophesee.repositories.user;

import com.tajprod.prophesee.models.user.User;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends CrudRepository<User, UUID> {
  Optional<User> findByEmail(String email);

  @NotNull
  List<User> findAll();
}