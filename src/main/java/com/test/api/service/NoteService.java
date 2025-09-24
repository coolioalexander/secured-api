package com.test.api.service;

import org.springframework.stereotype.Component;
import com.test.api.model.Note;

import java.util.Collections;
import java.util.List;

@Component
public class NoteService {

    public List<Note> getNotes() {
        return Collections.emptyList();
    }
}
