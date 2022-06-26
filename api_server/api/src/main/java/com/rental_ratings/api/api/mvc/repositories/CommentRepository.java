package com.rental_ratings.api.api.mvc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rental_ratings.api.api.mvc.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {

    public List<Comment> findAllByOnPropertyId(Long propertyId);

    public List<Comment> findAllByOnCommentId(Long commentId);
}
