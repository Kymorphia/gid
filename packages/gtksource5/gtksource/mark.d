/// Module for [Mark] class
module gtksource.mark;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.text_mark;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Mark object for `class@Buffer`.
    
    A [gtksource.mark.Mark] marks a position in the text where you want to display
    additional info. It is based on [gtk.text_mark.TextMark] and thus is still valid after
    the text has changed though its position may change.
    
    [gtksource.mark.Mark]s are organized in categories which you have to set
    when you create the mark. Each category can have a priority, a pixbuf and
    other associated attributes. See [gtksource.view.View.setMarkAttributes].
    The pixbuf will be displayed in the margin at the line where the mark
    residents if the `property@View:show-line-marks` property is set to true. If
    there are multiple marks in the same line, the pixbufs will be drawn on top
    of each other. The mark with the highest priority will be drawn on top.
*/
class Mark : gtk.text_mark.TextMark
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_mark_get_type != &gidSymbolNotFound ? gtk_source_mark_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Mark self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.mark.Mark]
  Returns: New builder object
  */
  static MarkGidBuilder builder()
  {
    return new MarkGidBuilder;
  }

  /**
      Get `category` property.
      Returns: The category of the [gtksource.mark.Mark], classifies the mark and controls
        which pixbuf is used and with which priority it is drawn.
  */
  @property string category()
  {
    return getCategory();
  }

  /**
      Creates a text mark.
      
      Add it to a buffer using [gtk.text_buffer.TextBuffer.addMark].
      If name is NULL, the mark is anonymous; otherwise, the mark can be retrieved
      by name using [gtk.text_buffer.TextBuffer.getMark].
      Normally marks are created using the utility function
      [gtksource.buffer.Buffer.createSourceMark].
  
      Params:
        name = Name of the #GtkSourceMark or null
        category = is used to classify marks according to common characteristics
            (e.g. all the marks representing a bookmark could belong to the "bookmark"
            category, or all the marks representing a compilation error could belong
            to "error" category).
      Returns: a new #GtkSourceMark that can be added using [gtk.text_buffer.TextBuffer.addMark].
  */
  this(string name, string category)
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_new(_name, _category);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the mark category.
      Returns: the category of the #GtkSourceMark.
  */
  string getCategory()
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_get_category(cast(GtkSourceMark*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the next [gtksource.mark.Mark] in the buffer or null if the mark
      was not added to a buffer.
      
       If there is no next mark, null will be returned.
      
      If category is null, looks for marks of any category.
  
      Params:
        category = a string specifying the mark category, or null.
      Returns: the next #GtkSourceMark, or null.
  */
  gtksource.mark.Mark next(string category = null)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_next(cast(GtkSourceMark*)this._cPtr, _category);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the previous [gtksource.mark.Mark] in the buffer or null if the mark
      was not added to a buffer.
      
      If there is no previous mark, null is returned.
      
      If category is null, looks for marks of any category
  
      Params:
        category = a string specifying the mark category, or null.
      Returns: the previous #GtkSourceMark, or null.
  */
  gtksource.mark.Mark prev(string category = null)
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_mark_prev(cast(GtkSourceMark*)this._cPtr, _category);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }
}

class MarkGidBuilderImpl(T) : gtk.text_mark.TextMarkGidBuilderImpl!T
{

  /**
      Set `category` property.
      Params:
        propval = The category of the [gtksource.mark.Mark], classifies the mark and controls
          which pixbuf is used and with which priority it is drawn.
      Returns: Builder instance for fluent chaining
  */
  T category(string propval)
  {
    return setProperty("category", propval);
  }
}

/// Fluent builder for [gtksource.mark.Mark]
final class MarkGidBuilder : MarkGidBuilderImpl!MarkGidBuilder
{
  Mark build()
  {
    return new Mark(cast(void*)createGObject(Mark._getGType), Yes.Take);
  }
}
