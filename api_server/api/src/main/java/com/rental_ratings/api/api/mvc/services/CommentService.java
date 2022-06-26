package com.rental_ratings.api.api.mvc.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rental_ratings.api.api.mvc.models.Comment;
import com.rental_ratings.api.api.mvc.repositories.CommentRepository;

@Service
public class CommentService {
    
    private final CommentRepository commentRepository;

    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public List<Comment> getAllByPropertyId(Long propertyId) {
        return commentRepository.findAllByOnPropertyId(propertyId);
    }

    public List<Comment> getAllByCommentId(Long commentId) {
        return commentRepository.findAllByOnCommentId(commentId);
    }

    public Comment create(Comment comment) {
        return commentRepository.save(comment);
    }

    public Comment update(Comment comment) {
        return commentRepository.save(comment);
    }

    public void delete(Long commentId) {
        commentRepository.deleteById(commentId);
    }

    public void delete(Comment comment) {
        commentRepository.delete(comment);
    }
}
