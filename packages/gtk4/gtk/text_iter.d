/// Module for [TextIter] class
module gtk.text_iter;

import gdk.paintable;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_buffer;
import gtk.text_child_anchor;
import gtk.text_mark;
import gtk.text_tag;
import gtk.types;
import pango.language;

/**
    An iterator for the contents of a [gtk.text_buffer.TextBuffer].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
*/
class TextIter : gobject.boxed.Boxed
{

  /**
      Create a `text_iter.TextIter` boxed type.
  */
  this()
  {
    super(gMalloc(GtkTextIter.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_iter_get_type != &gidSymbolNotFound ? gtk_text_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextIter self()
  {
    return this;
  }

  /**
      Assigns the value of other to iter.
      
      This function is not useful in applications, because
      iterators can be assigned with `GtkTextIter i = j;`.
      
      The function is used by language bindings.
  
      Params:
        other = another [gtk.text_iter.TextIter]
  */
  void assign(gtk.text_iter.TextIter other)
  {
    gtk_text_iter_assign(cast(GtkTextIter*)this._cPtr, other ? cast(const(GtkTextIter)*)other._cPtr(No.Dup) : null);
  }

  /**
      Moves backward by one character offset.
      
      Returns true if movement was possible; if iter was the first
      in the buffer (character offset 0), this function returns false
      for convenience when writing loops.
      Returns: whether movement was possible
  */
  bool backwardChar()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_char(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count characters backward, if possible.
      
      If count would move past the start or end of the buffer, moves
      to the start or end of the buffer.
      
      The return value indicates whether the iterator moved
      onto a dereferenceable position; if the iterator didn’t move, or
      moved onto the end iterator, then false is returned. If count is 0,
      the function does nothing and returns false.
  
      Params:
        count = number of characters to move
      Returns: whether iter moved and is dereferenceable
  */
  bool backwardChars(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_chars(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Like [gtk.text_iter.TextIter.forwardCursorPosition], but moves backward.
      Returns: true if we moved
  */
  bool backwardCursorPosition()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_cursor_position(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves up to count cursor positions.
      
      See [gtk.text_iter.TextIter.forwardCursorPosition] for details.
  
      Params:
        count = number of positions to move
      Returns: true if we moved and the new position is dereferenceable
  */
  bool backwardCursorPositions(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_cursor_positions(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Same as [gtk.text_iter.TextIter.forwardFindChar],
      but goes backward from iter.
  
      Params:
        pred = function to be called on each character
        limit = search limit
      Returns: whether a match was found
  */
  bool backwardFindChar(gtk.types.TextCharPredicate pred, gtk.text_iter.TextIter limit = null)
  {
    extern(C) gboolean _predCallback(dchar ch, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TextCharPredicate*)userData;

      _dretval = (*_dlg)(ch);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _predCB = pred ? &_predCallback : null;
    bool _retval;
    auto _pred = pred ? cast(void*)&(pred) : null;
    _retval = cast(bool)gtk_text_iter_backward_find_char(cast(GtkTextIter*)this._cPtr, _predCB, _pred, limit ? cast(const(GtkTextIter)*)limit._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter to the start of the previous line.
      
      Returns true if iter could be moved; i.e. if iter was at
      character offset 0, this function returns false. Therefore,
      if iter was already on line 0, but not at the start of the line,
      iter is snapped to the start of the line and the function returns
      true. (Note that this implies that
      in a loop calling this function, the line number may not change on
      every iteration, if your first iteration is on line 0.)
      Returns: whether iter moved
  */
  bool backwardLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_line(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count lines backward, if possible.
      
      If count would move past the start or end of the buffer, moves to
      the start or end of the buffer.
      
      The return value indicates whether the iterator moved
      onto a dereferenceable position; if the iterator didn’t move, or
      moved onto the end iterator, then false is returned. If count is 0,
      the function does nothing and returns false. If count is negative,
      moves forward by 0 - count lines.
  
      Params:
        count = number of lines to move backward
      Returns: whether iter moved and is dereferenceable
  */
  bool backwardLines(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_lines(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Same as [gtk.text_iter.TextIter.forwardSearch], but moves backward.
      
      match_end will never be set to a [gtk.text_iter.TextIter] located after iter,
      even if there is a possible match_start before or at iter.
  
      Params:
        str = search string
        flags = bitmask of flags affecting the search
        matchStart = return location for start of match
        matchEnd = return location for end of match
        limit = location of last possible match_start, or null for start of buffer
      Returns: whether a match was found
  */
  bool backwardSearch(string str, gtk.types.TextSearchFlags flags, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, gtk.text_iter.TextIter limit = null)
  {
    bool _retval;
    const(char)* _str = str.toCString(No.Alloc);
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = cast(bool)gtk_text_iter_backward_search(cast(const(GtkTextIter)*)this._cPtr, _str, flags, &_matchStart, &_matchEnd, limit ? cast(const(GtkTextIter)*)limit._cPtr(No.Dup) : null);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
      Moves backward to the previous sentence start.
      
      If iter is already at the start of a sentence, moves backward
      to the next one.
      
      Sentence boundaries are determined by Pango and should
      be correct for nearly any language.
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardSentenceStart()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_sentence_start(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.backwardSentenceStart] up to count times.
      
      If count is negative, moves forward instead of backward.
  
      Params:
        count = number of sentences to move
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardSentenceStarts(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_sentence_starts(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves backward to the next toggle (on or off) of the
      tag, or to the next toggle of any tag if
      tag is null.
      
      If no matching tag toggles are found,
      returns false, otherwise true. Does not return toggles
      located at iter, only toggles before iter. Sets iter
      to the location of the toggle, or the start of the buffer
      if no toggle is found.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether we found a tag toggle before iter
  */
  bool backwardToTagToggle(gtk.text_tag.TextTag tag = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_to_tag_toggle(cast(GtkTextIter*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter backward to the previous visible cursor position.
      
      See [gtk.text_iter.TextIter.backwardCursorPosition] for details.
      Returns: true if we moved and the new position is dereferenceable
  */
  bool backwardVisibleCursorPosition()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_cursor_position(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves up to count visible cursor positions.
      
      See [gtk.text_iter.TextIter.backwardCursorPosition] for details.
  
      Params:
        count = number of positions to move
      Returns: true if we moved and the new position is dereferenceable
  */
  bool backwardVisibleCursorPositions(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_cursor_positions(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves iter to the start of the previous visible line.
      
      Returns true if
      iter could be moved; i.e. if iter was at character offset 0, this
      function returns false. Therefore if iter was already on line 0,
      but not at the start of the line, iter is snapped to the start of
      the line and the function returns true. (Note that this implies that
      in a loop calling this function, the line number may not change on
      every iteration, if your first iteration is on line 0.)
      Returns: whether iter moved
  */
  bool backwardVisibleLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_line(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count visible lines backward, if possible.
      
      If count would move past the start or end of the buffer, moves to
      the start or end of the buffer.
      
      The return value indicates whether the iterator moved
      onto a dereferenceable position; if the iterator didn’t move, or
      moved onto the end iterator, then false is returned. If count is 0,
      the function does nothing and returns false. If count is negative,
      moves forward by 0 - count lines.
  
      Params:
        count = number of lines to move backward
      Returns: whether iter moved and is dereferenceable
  */
  bool backwardVisibleLines(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_lines(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves backward to the previous visible word start.
      
      If iter is currently on a word start, moves backward to the
      next one after that.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language.
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardVisibleWordStart()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_word_start(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.backwardVisibleWordStart] up to count times.
  
      Params:
        count = number of times to move
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardVisibleWordStarts(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_visible_word_starts(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves backward to the previous word start.
      
      If iter is currently on a word start, moves backward to the
      next one after that.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardWordStart()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_word_start(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.backwardWordStart] up to count times.
  
      Params:
        count = number of times to move
      Returns: true if iter moved and is not the end iterator
  */
  bool backwardWordStarts(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_backward_word_starts(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Considering the default editability of the buffer, and tags that
      affect editability, determines whether text inserted at iter would
      be editable.
      
      If text inserted at iter would be editable then the
      user should be allowed to insert text at iter.
      [gtk.text_buffer.TextBuffer.insertInteractive] uses this function
      to decide whether insertions are allowed at a given position.
  
      Params:
        defaultEditability = true if text is editable by default
      Returns: whether text inserted at iter would be editable
  */
  bool canInsert(bool defaultEditability)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_can_insert(cast(const(GtkTextIter)*)this._cPtr, defaultEditability);
    return _retval;
  }

  /**
      A qsort()-style function that returns negative if lhs is less than
      rhs, positive if lhs is greater than rhs, and 0 if they’re equal.
      
      Ordering is in character offset order, i.e. the first character
      in the buffer is less than the second character in the buffer.
  
      Params:
        rhs = another [gtk.text_iter.TextIter]
      Returns: -1 if lhs is less than rhs, 1 if lhs is greater, 0 if they are equal
  */
  int compare(gtk.text_iter.TextIter rhs)
  {
    int _retval;
    _retval = gtk_text_iter_compare(cast(const(GtkTextIter)*)this._cPtr, rhs ? cast(const(GtkTextIter)*)rhs._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a dynamically-allocated copy of an iterator.
      
      This function is not useful in applications, because
      iterators can be copied with a simple assignment
      (`GtkTextIter i = j;`).
      
      The function is used by language bindings.
      Returns: a copy of the iter, free with [gtk.text_iter.TextIter.free]
  */
  gtk.text_iter.TextIter copy()
  {
    GtkTextIter* _cretval;
    _cretval = gtk_text_iter_copy(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = _cretval ? new gtk.text_iter.TextIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the character at iter is within an editable region
      of text.
      
      Non-editable text is “locked” and can’t be changed by the
      user via [gtk.text_view.TextView]. If no tags applied to this text affect
      editability, default_setting will be returned.
      
      You don’t want to use this function to decide whether text can be
      inserted at iter, because for insertion you don’t want to know
      whether the char at iter is inside an editable range, you want to
      know whether a new character inserted at iter would be inside an
      editable range. Use [gtk.text_iter.TextIter.canInsert] to handle this
      case.
  
      Params:
        defaultSetting = true if text is editable by default
      Returns: whether iter is inside an editable range
  */
  bool editable(bool defaultSetting)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_editable(cast(const(GtkTextIter)*)this._cPtr, defaultSetting);
    return _retval;
  }

  /**
      Returns true if iter points to the start of the paragraph
      delimiter characters for a line.
      
      Delimiters will be either a newline, a carriage return, a carriage
      return followed by a newline, or a Unicode paragraph separator
      character.
      
      Note that an iterator pointing to the \n of a \r\n pair will not be
      counted as the end of a line, the line ends before the \r. The end
      iterator is considered to be at the end of a line, even though there
      are no paragraph delimiter chars there.
      Returns: whether iter is at the end of a line
  */
  bool endsLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_ends_line(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether iter ends a sentence.
      
      Sentence boundaries are determined by Pango and should
      be correct for nearly any language.
      Returns: true if iter is at the end of a sentence.
  */
  bool endsSentence()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_ends_sentence(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if tag is toggled off at exactly this point.
      
      If tag is null, returns true if any tag is toggled off at this point.
      
      Note that if this function returns true, it means that
      iter is at the end of the tagged range, but that the character
      at iter is outside the tagged range. In other words,
      unlike [gtk.text_iter.TextIter.startsTag], if this function
      returns true, [gtk.text_iter.TextIter.hasTag] will return
      false for the same parameters.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether iter is the end of a range tagged with tag
  */
  bool endsTag(gtk.text_tag.TextTag tag = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_ends_tag(cast(const(GtkTextIter)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether iter ends a natural-language word.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language.
      Returns: true if iter is at the end of a word
  */
  bool endsWord()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_ends_word(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether two iterators are equal, using the fastest possible
      mechanism.
      
      This function is very fast; you can expect it to perform
      better than e.g. getting the character offset for each
      iterator and comparing the offsets yourself. Also, it’s a
      bit faster than [gtk.text_iter.TextIter.compare].
  
      Params:
        rhs = another [gtk.text_iter.TextIter]
      Returns: true if the iterators point to the same place in the buffer
  */
  bool equal(gtk.text_iter.TextIter rhs)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_equal(cast(const(GtkTextIter)*)this._cPtr, rhs ? cast(const(GtkTextIter)*)rhs._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter forward by one character offset.
      
      Note that images embedded in the buffer occupy 1 character slot, so
      this function may actually move onto an image instead of a character,
      if you have images in your buffer. If iter is the end iterator or
      one character before it, iter will now point at the end iterator,
      and this function returns false for convenience when writing loops.
      Returns: whether iter moved and is dereferenceable
  */
  bool forwardChar()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_char(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count characters if possible.
      
      If count would move past the start or end of the buffer,
      moves to the start or end of the buffer.
      
      The return value indicates whether the new position of
      iter is different from its original position, and dereferenceable
      (the last iterator in the buffer is not dereferenceable). If count
      is 0, the function does nothing and returns false.
  
      Params:
        count = number of characters to move, may be negative
      Returns: whether iter moved and is dereferenceable
  */
  bool forwardChars(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_chars(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves iter forward by a single cursor position.
      
      Cursor positions are (unsurprisingly) positions where the
      cursor can appear. Perhaps surprisingly, there may not be
      a cursor position between all characters. The most common
      example for European languages would be a carriage return/newline
      sequence.
      
      For some Unicode characters, the equivalent of say the letter “a”
      with an accent mark will be represented as two characters, first
      the letter then a "combining mark" that causes the accent to be
      rendered; so the cursor can’t go between those two characters.
      
      See also the [pango.types.LogAttr] struct and the `funcPango.break`
      function.
      Returns: true if we moved and the new position is dereferenceable
  */
  bool forwardCursorPosition()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_cursor_position(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves up to count cursor positions.
      
      See [gtk.text_iter.TextIter.forwardCursorPosition] for details.
  
      Params:
        count = number of positions to move
      Returns: true if we moved and the new position is dereferenceable
  */
  bool forwardCursorPositions(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_cursor_positions(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Advances iter, calling pred on each character.
      
      If pred returns true, returns true and stops scanning.
      If pred never returns true, iter is set to limit if
      limit is non-null, otherwise to the end iterator.
  
      Params:
        pred = a function to be called on each character
        limit = search limit
      Returns: whether a match was found
  */
  bool forwardFindChar(gtk.types.TextCharPredicate pred, gtk.text_iter.TextIter limit = null)
  {
    extern(C) gboolean _predCallback(dchar ch, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TextCharPredicate*)userData;

      _dretval = (*_dlg)(ch);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _predCB = pred ? &_predCallback : null;
    bool _retval;
    auto _pred = pred ? cast(void*)&(pred) : null;
    _retval = cast(bool)gtk_text_iter_forward_find_char(cast(GtkTextIter*)this._cPtr, _predCB, _pred, limit ? cast(const(GtkTextIter)*)limit._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter to the start of the next line.
      
      If the iter is already on the last line of the buffer,
      moves the iter to the end of the current line. If after
      the operation, the iter is at the end of the buffer and not
      dereferenceable, returns false. Otherwise, returns true.
      Returns: whether iter can be dereferenced
  */
  bool forwardLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_line(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count lines forward, if possible.
      
      If count would move past the start or end of the buffer, moves to
      the start or end of the buffer.
      
      The return value indicates whether the iterator moved
      onto a dereferenceable position; if the iterator didn’t move, or
      moved onto the end iterator, then false is returned. If count is 0,
      the function does nothing and returns false. If count is negative,
      moves backward by 0 - count lines.
  
      Params:
        count = number of lines to move forward
      Returns: whether iter moved and is dereferenceable
  */
  bool forwardLines(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_lines(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Searches forward for str.
      
      Any match is returned by setting match_start to the first character
      of the match and match_end to the first character after the match.
      The search will not continue past limit. Note that a search is a
      linear or O(n) operation, so you may wish to use limit to avoid
      locking up your UI on large buffers.
      
      match_start will never be set to a [gtk.text_iter.TextIter] located before iter,
      even if there is a possible match_end after or at iter.
  
      Params:
        str = a search string
        flags = flags affecting how the search is done
        matchStart = return location for start of match
        matchEnd = return location for end of match
        limit = location of last possible match_end, or null for the end of the buffer
      Returns: whether a match was found
  */
  bool forwardSearch(string str, gtk.types.TextSearchFlags flags, out gtk.text_iter.TextIter matchStart, out gtk.text_iter.TextIter matchEnd, gtk.text_iter.TextIter limit = null)
  {
    bool _retval;
    const(char)* _str = str.toCString(No.Alloc);
    GtkTextIter _matchStart;
    GtkTextIter _matchEnd;
    _retval = cast(bool)gtk_text_iter_forward_search(cast(const(GtkTextIter)*)this._cPtr, _str, flags, &_matchStart, &_matchEnd, limit ? cast(const(GtkTextIter)*)limit._cPtr(No.Dup) : null);
    matchStart = new gtk.text_iter.TextIter(cast(void*)&_matchStart, No.Take);
    matchEnd = new gtk.text_iter.TextIter(cast(void*)&_matchEnd, No.Take);
    return _retval;
  }

  /**
      Moves forward to the next sentence end.
      
      If iter is at the end of a sentence, moves to the next
      end of sentence.
      
      Sentence boundaries are determined by Pango and should
      be correct for nearly any language.
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardSentenceEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_sentence_end(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.forwardSentenceEnd] count times.
      
      If count is negative, moves backward instead of forward.
  
      Params:
        count = number of sentences to move
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardSentenceEnds(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_sentence_ends(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves iter forward to the “end iterator”, which points
      one past the last valid character in the buffer.
      
      [gtk.text_iter.TextIter.getChar] called on the end iterator
      returns 0, which is convenient for writing loops.
  */
  void forwardToEnd()
  {
    gtk_text_iter_forward_to_end(cast(GtkTextIter*)this._cPtr);
  }

  /**
      Moves the iterator to point to the paragraph delimiter characters.
      
      The possible characters are either a newline, a carriage return,
      a carriage return/newline in sequence, or the Unicode paragraph
      separator character.
      
      If the iterator is already at the paragraph delimiter
      characters, moves to the paragraph delimiter characters for the
      next line. If iter is on the last line in the buffer, which does
      not end in paragraph delimiters, moves to the end iterator (end of
      the last line), and returns false.
      Returns: true if we moved and the new location is not the end iterator
  */
  bool forwardToLineEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_to_line_end(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves forward to the next toggle (on or off) of the
      tag, or to the next toggle of any tag if
      tag is null.
      
      If no matching tag toggles are found,
      returns false, otherwise true. Does not return toggles
      located at iter, only toggles after iter. Sets iter to
      the location of the toggle, or to the end of the buffer
      if no toggle is found.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether we found a tag toggle after iter
  */
  bool forwardToTagToggle(gtk.text_tag.TextTag tag = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_to_tag_toggle(cast(GtkTextIter*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter forward to the next visible cursor position.
      
      See [gtk.text_iter.TextIter.forwardCursorPosition] for details.
      Returns: true if we moved and the new position is dereferenceable
  */
  bool forwardVisibleCursorPosition()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_cursor_position(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves up to count visible cursor positions.
      
      See [gtk.text_iter.TextIter.forwardCursorPosition] for details.
  
      Params:
        count = number of positions to move
      Returns: true if we moved and the new position is dereferenceable
  */
  bool forwardVisibleCursorPositions(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_cursor_positions(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves iter to the start of the next visible line.
      
      Returns true if there
      was a next line to move to, and false if iter was simply moved to
      the end of the buffer and is now not dereferenceable, or if iter was
      already at the end of the buffer.
      Returns: whether iter can be dereferenced
  */
  bool forwardVisibleLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_line(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves count visible lines forward, if possible.
      
      If count would move past the start or end of the buffer, moves to
      the start or end of the buffer.
      
      The return value indicates whether the iterator moved
      onto a dereferenceable position; if the iterator didn’t move, or
      moved onto the end iterator, then false is returned. If count is 0,
      the function does nothing and returns false. If count is negative,
      moves backward by 0 - count lines.
  
      Params:
        count = number of lines to move forward
      Returns: whether iter moved and is dereferenceable
  */
  bool forwardVisibleLines(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_lines(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves forward to the next visible word end.
      
      If iter is currently on a word end, moves forward to the
      next one after that.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardVisibleWordEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_word_end(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.forwardVisibleWordEnd] up to count times.
  
      Params:
        count = number of times to move
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardVisibleWordEnds(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_visible_word_ends(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Moves forward to the next word end.
      
      If iter is currently on a word end, moves forward to the
      next one after that.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language.
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardWordEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_word_end(cast(GtkTextIter*)this._cPtr);
    return _retval;
  }

  /**
      Calls [gtk.text_iter.TextIter.forwardWordEnd] up to count times.
  
      Params:
        count = number of times to move
      Returns: true if iter moved and is not the end iterator
  */
  bool forwardWordEnds(int count)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_forward_word_ends(cast(GtkTextIter*)this._cPtr, count);
    return _retval;
  }

  /**
      Returns the [gtk.text_buffer.TextBuffer] this iterator is associated with.
      Returns: the buffer
  */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_iter_get_buffer(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the number of bytes in the line containing iter,
      including the paragraph delimiters.
      Returns: number of bytes in the line
  */
  int getBytesInLine()
  {
    int _retval;
    _retval = gtk_text_iter_get_bytes_in_line(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      The Unicode character at this iterator is returned.
      
      Equivalent to operator* on a C++ iterator. If the element at
      this iterator is a non-character element, such as an image
      embedded in the buffer, the Unicode “unknown” character 0xFFFC
      is returned. If invoked on the end iterator, zero is returned;
      zero is not a valid Unicode character.
      
      So you can write a loop which ends when this function returns 0.
      Returns: a Unicode character, or 0 if iter is not dereferenceable
  */
  dchar getChar()
  {
    dchar _retval;
    _retval = gtk_text_iter_get_char(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of characters in the line containing iter,
      including the paragraph delimiters.
      Returns: number of characters in the line
  */
  int getCharsInLine()
  {
    int _retval;
    _retval = gtk_text_iter_get_chars_in_line(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      If the location at iter contains a child anchor, the
      anchor is returned.
      
      Otherwise, null is returned.
      Returns: the anchor at iter
  */
  gtk.text_child_anchor.TextChildAnchor getChildAnchor()
  {
    GtkTextChildAnchor* _cretval;
    _cretval = gtk_text_iter_get_child_anchor(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_child_anchor.TextChildAnchor)(cast(GtkTextChildAnchor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the language in effect at iter.
      
      If no tags affecting language apply to iter, the return
      value is identical to that of `funcGtk.get_default_language`.
      Returns: language in effect at iter
  */
  pango.language.Language getLanguage()
  {
    PangoLanguage* _cretval;
    _cretval = gtk_text_iter_get_language(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the line number containing the iterator.
      
      Lines in a [gtk.text_buffer.TextBuffer] are numbered beginning
      with 0 for the first line in the buffer.
      Returns: a line number
  */
  int getLine()
  {
    int _retval;
    _retval = gtk_text_iter_get_line(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the byte index of the iterator, counting
      from the start of a newline-terminated line.
      
      Remember that [gtk.text_buffer.TextBuffer] encodes text in
      UTF-8, and that characters can require a variable
      number of bytes to represent.
      Returns: distance from start of line, in bytes
  */
  int getLineIndex()
  {
    int _retval;
    _retval = gtk_text_iter_get_line_index(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the character offset of the iterator,
      counting from the start of a newline-terminated line.
      
      The first character on the line has offset 0.
      Returns: offset from start of line
  */
  int getLineOffset()
  {
    int _retval;
    _retval = gtk_text_iter_get_line_offset(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a list of all [gtk.text_mark.TextMark] at this location.
      
      Because marks are not iterable (they don’t take up any "space"
      in the buffer, they are just marks in between iterable locations),
      multiple marks can exist in the same place.
      
      The returned list is not in any meaningful order.
      Returns: list of [gtk.text_mark.TextMark]
  */
  gtk.text_mark.TextMark[] getMarks()
  {
    GSList* _cretval;
    _cretval = gtk_text_iter_get_marks(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = gSListToD!(gtk.text_mark.TextMark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the character offset of an iterator.
      
      Each character in a [gtk.text_buffer.TextBuffer] has an offset,
      starting with 0 for the first character in the buffer.
      Use [gtk.text_buffer.TextBuffer.getIterAtOffset] to convert
      an offset back into an iterator.
      Returns: a character offset
  */
  int getOffset()
  {
    int _retval;
    _retval = gtk_text_iter_get_offset(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      If the element at iter is a paintable, the paintable is returned.
      
      Otherwise, null is returned.
      Returns: the paintable at iter
  */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_text_iter_get_paintable(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the text in the given range.
      
      A “slice” is an array of characters encoded in UTF-8 format,
      including the Unicode “unknown” character 0xFFFC for iterable
      non-character elements in the buffer, such as images.
      Because images are encoded in the slice, byte and
      character offsets in the returned array will correspond to byte
      offsets in the text buffer. Note that 0xFFFC can occur in normal
      text as well, so it is not a reliable indicator that a paintable or
      widget is in the buffer.
  
      Params:
        end = iterator at end of a range
      Returns: slice of text from the buffer
  */
  string getSlice(gtk.text_iter.TextIter end)
  {
    char* _cretval;
    _cretval = gtk_text_iter_get_slice(cast(const(GtkTextIter)*)this._cPtr, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns a list of tags that apply to iter, in ascending order of
      priority.
      
      The highest-priority tags are last.
      
      The [gtk.text_tag.TextTag]s in the list don’t have a reference added,
      but you have to free the list itself.
      Returns: list of
          [gtk.text_tag.TextTag]
  */
  gtk.text_tag.TextTag[] getTags()
  {
    GSList* _cretval;
    _cretval = gtk_text_iter_get_tags(cast(const(GtkTextIter)*)this._cPtr);
    auto _retval = gSListToD!(gtk.text_tag.TextTag, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns text in the given range.
      
      If the range
      contains non-text elements such as images, the character and byte
      offsets in the returned string will not correspond to character and
      byte offsets in the buffer. If you want offsets to correspond, see
      [gtk.text_iter.TextIter.getSlice].
  
      Params:
        end = iterator at end of a range
      Returns: array of characters from the buffer
  */
  string getText(gtk.text_iter.TextIter end)
  {
    char* _cretval;
    _cretval = gtk_text_iter_get_text(cast(const(GtkTextIter)*)this._cPtr, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns a list of [gtk.text_tag.TextTag] that are toggled on or off at this
      point.
      
      If toggled_on is true, the list contains tags that are
      toggled on. If a tag is toggled on at iter, then some non-empty
      range of characters following iter has that tag applied to it.  If
      a tag is toggled off, then some non-empty range following iter
      does not have the tag applied to it.
  
      Params:
        toggledOn = true to get toggled-on tags
      Returns: tags
          toggled at this point
  */
  gtk.text_tag.TextTag[] getToggledTags(bool toggledOn)
  {
    GSList* _cretval;
    _cretval = gtk_text_iter_get_toggled_tags(cast(const(GtkTextIter)*)this._cPtr, toggledOn);
    auto _retval = gSListToD!(gtk.text_tag.TextTag, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the number of bytes from the start of the
      line to the given iter, not counting bytes that
      are invisible due to tags with the “invisible” flag
      toggled on.
      Returns: byte index of iter with respect to the start of the line
  */
  int getVisibleLineIndex()
  {
    int _retval;
    _retval = gtk_text_iter_get_visible_line_index(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the offset in characters from the start of the
      line to the given iter, not counting characters that
      are invisible due to tags with the “invisible” flag
      toggled on.
      Returns: offset in visible characters from the start of the line
  */
  int getVisibleLineOffset()
  {
    int _retval;
    _retval = gtk_text_iter_get_visible_line_offset(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns visible text in the given range.
      
      Like [gtk.text_iter.TextIter.getSlice], but invisible text
      is not included. Invisible text is usually invisible because
      a [gtk.text_tag.TextTag] with the “invisible” attribute turned on has
      been applied to it.
  
      Params:
        end = iterator at end of range
      Returns: slice of text from the buffer
  */
  string getVisibleSlice(gtk.text_iter.TextIter end)
  {
    char* _cretval;
    _cretval = gtk_text_iter_get_visible_slice(cast(const(GtkTextIter)*)this._cPtr, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns visible text in the given range.
      
      Like [gtk.text_iter.TextIter.getText], but invisible text
      is not included. Invisible text is usually invisible because
      a [gtk.text_tag.TextTag] with the “invisible” attribute turned on has
      been applied to it.
  
      Params:
        end = iterator at end of range
      Returns: string containing visible text in the
        range
  */
  string getVisibleText(gtk.text_iter.TextIter end)
  {
    char* _cretval;
    _cretval = gtk_text_iter_get_visible_text(cast(const(GtkTextIter)*)this._cPtr, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns true if iter points to a character that is part
      of a range tagged with tag.
      
      See also [gtk.text_iter.TextIter.startsTag] and
      [gtk.text_iter.TextIter.endsTag].
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether iter is tagged with tag
  */
  bool hasTag(gtk.text_tag.TextTag tag)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_has_tag(cast(const(GtkTextIter)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether iter falls in the range [start, end).
      
      start and end must be in ascending order.
  
      Params:
        start = start of range
        end = end of range
      Returns: true if iter is in the range
  */
  bool inRange(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_in_range(cast(const(GtkTextIter)*)this._cPtr, start ? cast(const(GtkTextIter)*)start._cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether iter is inside a sentence (as opposed to in
      between two sentences, e.g. after a period and before the first
      letter of the next sentence).
      
      Sentence boundaries are determined by Pango and should be correct
      for nearly any language.
      Returns: true if iter is inside a sentence.
  */
  bool insideSentence()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_inside_sentence(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the character pointed by iter is part of a
      natural-language word (as opposed to say inside some whitespace).
      
      Word breaks are determined by Pango and should be correct
      for nearly any language.
      
      Note that if [gtk.text_iter.TextIter.startsWord] returns true,
      then this function returns true too, since iter points to
      the first character of the word.
      Returns: true if iter is inside a word
  */
  bool insideWord()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_inside_word(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Determine if iter is at a cursor position.
      
      See [gtk.text_iter.TextIter.forwardCursorPosition] or
      [pango.types.LogAttr] or `funcPango.break` for details
      on what a cursor position is.
      Returns: true if the cursor can be placed at iter
  */
  bool isCursorPosition()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_is_cursor_position(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if iter is the end iterator.
      
      This means it is one past the last dereferenceable iterator
      in the buffer. [gtk.text_iter.TextIter.isEnd] is the most efficient
      way to check whether an iterator is the end iterator.
      Returns: whether iter is the end iterator
  */
  bool isEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_is_end(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if iter is the first iterator in the buffer.
      Returns: whether iter is the first in the buffer
  */
  bool isStart()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_is_start(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Swaps the value of first and second if second comes before
      first in the buffer.
      
      That is, ensures that first and second are in sequence.
      Most text buffer functions that take a range call this
      automatically on your behalf, so there’s no real reason to
      call it yourself in those cases. There are some exceptions,
      such as [gtk.text_iter.TextIter.inRange], that expect a
      pre-sorted range.
  
      Params:
        second = another [gtk.text_iter.TextIter]
  */
  void order(gtk.text_iter.TextIter second)
  {
    gtk_text_iter_order(cast(GtkTextIter*)this._cPtr, second ? cast(GtkTextIter*)second._cPtr(No.Dup) : null);
  }

  /**
      Moves iterator iter to the start of the line line_number.
      
      If line_number is negative or larger than or equal to the number of lines
      in the buffer, moves iter to the start of the last line in the buffer.
  
      Params:
        lineNumber = line number (counted from 0)
  */
  void setLine(int lineNumber)
  {
    gtk_text_iter_set_line(cast(GtkTextIter*)this._cPtr, lineNumber);
  }

  /**
      Same as [gtk.text_iter.TextIter.setLineOffset], but works with a
      byte index. The given byte index must be at
      the start of a character, it can’t be in the middle of a UTF-8
      encoded character.
  
      Params:
        byteOnLine = a byte index relative to the start of iter’s current line
  */
  void setLineIndex(int byteOnLine)
  {
    gtk_text_iter_set_line_index(cast(GtkTextIter*)this._cPtr, byteOnLine);
  }

  /**
      Moves iter within a line, to a new character (not byte) offset.
      
      The given character offset must be less than or equal to the number
      of characters in the line; if equal, iter moves to the start of the
      next line. See [gtk.text_iter.TextIter.setLineIndex] if you have a byte
      index rather than a character offset.
  
      Params:
        charOnLine = a character offset relative to the start of iter’s current line
  */
  void setLineOffset(int charOnLine)
  {
    gtk_text_iter_set_line_offset(cast(GtkTextIter*)this._cPtr, charOnLine);
  }

  /**
      Sets iter to point to char_offset.
      
      char_offset counts from the start
      of the entire text buffer, starting with 0.
  
      Params:
        charOffset = a character number
  */
  void setOffset(int charOffset)
  {
    gtk_text_iter_set_offset(cast(GtkTextIter*)this._cPtr, charOffset);
  }

  /**
      Like [gtk.text_iter.TextIter.setLineIndex], but the index is in visible
      bytes, i.e. text with a tag making it invisible is not counted
      in the index.
  
      Params:
        byteOnLine = a byte index
  */
  void setVisibleLineIndex(int byteOnLine)
  {
    gtk_text_iter_set_visible_line_index(cast(GtkTextIter*)this._cPtr, byteOnLine);
  }

  /**
      Like [gtk.text_iter.TextIter.setLineOffset], but the offset is in visible
      characters, i.e. text with a tag making it invisible is not
      counted in the offset.
  
      Params:
        charOnLine = a character offset
  */
  void setVisibleLineOffset(int charOnLine)
  {
    gtk_text_iter_set_visible_line_offset(cast(GtkTextIter*)this._cPtr, charOnLine);
  }

  /**
      Returns true if iter begins a paragraph.
      
      This is the case if [gtk.text_iter.TextIter.getLineOffset]
      would return 0. However this function is potentially more
      efficient than [gtk.text_iter.TextIter.getLineOffset], because
      it doesn’t have to compute the offset, it just has to see
      whether it’s 0.
      Returns: whether iter begins a line
  */
  bool startsLine()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_starts_line(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether iter begins a sentence.
      
      Sentence boundaries are determined by Pango and
      should be correct for nearly any language.
      Returns: true if iter is at the start of a sentence.
  */
  bool startsSentence()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_starts_sentence(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if tag is toggled on at exactly this point.
      
      If tag is null, returns true if any tag is toggled on at this point.
      
      Note that if this function returns true, it means that
      iter is at the beginning of the tagged range, and that the
      character at iter is inside the tagged range. In other
      words, unlike [gtk.text_iter.TextIter.endsTag], if
      this function returns true, [gtk.text_iter.TextIter.hasTag]
      will also return true for the same parameters.
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether iter is the start of a range tagged with tag
  */
  bool startsTag(gtk.text_tag.TextTag tag = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_starts_tag(cast(const(GtkTextIter)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Determines whether iter begins a natural-language word.
      
      Word breaks are determined by Pango and should be correct
      for nearly any language.
      Returns: true if iter is at the start of a word
  */
  bool startsWord()
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_starts_word(cast(const(GtkTextIter)*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a range with tag applied to it begins
      or ends at iter.
      
      This is equivalent to ([gtk.text_iter.TextIter.startsTag] ||
      [gtk.text_iter.TextIter.endsTag])
  
      Params:
        tag = a [gtk.text_tag.TextTag]
      Returns: whether tag is toggled on or off at iter
  */
  bool togglesTag(gtk.text_tag.TextTag tag = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_iter_toggles_tag(cast(const(GtkTextIter)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
    return _retval;
  }
}
