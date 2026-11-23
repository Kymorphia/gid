/// Module for [Mark] class
module gid.gtksource5.mark;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_mark;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Mark object for [gid.gtksource5.buffer.Buffer].
    
    A [gid.gtksource5.mark.Mark] marks a position in the text where you want to display
    additional info. It is based on [gid.gtk4.text_mark.TextMark] and thus is still valid after
    the text has changed though its position may change.
    
    [gid.gtksource5.mark.Mark]s are organized in categories which you have to set
    when you create the mark. Each category can have a priority, a pixbuf and
    other associated attributes. See [gid.gtksource5.view.View.setMarkAttributes].
    The pixbuf will be displayed in the margin at the line where the mark
    residents if the [gid.gtksource5.view.View.showLineMarks] property is set to true. If
    there are multiple marks in the same line, the pixbufs will be drawn on top
    of each other. The mark with the highest priority will be drawn on top.
*/
class Mark : gid.gtk4.text_mark.TextMark
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_mark_get_type != &gidSymbolNotFound ? gtk_source_mark_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceMark";
  }

  /** Returns `this`, for use in `with` statements. */
  override Mark self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.mark.Mark]
      Returns: New builder object
  */
  static MarkGidBuilder builder() nothrow
  {
    return new MarkGidBuilder;
  }

  /**
      Get `category` property.
      Returns: The category of the [gid.gtksource5.mark.Mark], classifies the mark and controls
        which pixbuf is used and with which priority it is drawn.
  */
  @property string category() nothrow
  {
    return getCategory();
  }

  /**
      Creates a text mark.
      
      Add it to a buffer using [gid.gtk4.text_buffer.TextBuffer.addMark].
      If name is NULL, the mark is anonymous; otherwise, the mark can be retrieved
      by name using [gid.gtk4.text_buffer.TextBuffer.getMark].
      Normally marks are created using the utility function
      [gid.gtksource5.buffer.Buffer.createSourceMark].
  
      Params:
        name = Name of the #GtkSourceMark or null
        category = is used to classify marks according to common characteristics
            (e.g. all the marks representing a bookmark could belong to the "bookmark"
            category, or all the marks representing a compilation error could belong
            to "error" category).
      Returns: a new #GtkSourceMark that can be added using [gid.gtk4.text_buffer.TextBuffer.addMark].
  */
  this(string name, string category) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkSourceMark* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _category = category.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_source_mark_new(_name, _category);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the mark category.
      Returns: the category of the #GtkSourceMark.
  */
  string getCategory() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_mark_get_category(cast(GtkSourceMark*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the next [gid.gtksource5.mark.Mark] in the buffer or null if the mark
      was not added to a buffer.
      
       If there is no next mark, null will be returned.
      
      If category is null, looks for marks of any category.
  
      Params:
        category = a string specifying the mark category, or null.
      Returns: the next #GtkSourceMark, or null.
  */
  gid.gtksource5.mark.Mark next(string category = null) nothrow
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_mark_next(cast(GtkSourceMark*)this._cPtr, _category);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the previous [gid.gtksource5.mark.Mark] in the buffer or null if the mark
      was not added to a buffer.
      
      If there is no previous mark, null is returned.
      
      If category is null, looks for marks of any category
  
      Params:
        category = a string specifying the mark category, or null.
      Returns: the previous #GtkSourceMark, or null.
  */
  gid.gtksource5.mark.Mark prev(string category = null) nothrow
  {
    GtkSourceMark* _cretval;
    const(char)* _category = category.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_mark_prev(cast(GtkSourceMark*)this._cPtr, _category);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.mark.Mark]
class MarkGidBuilderImpl(T) : gid.gtk4.text_mark.TextMarkGidBuilderImpl!T
{

  /**
      Set `category` property.
      Params:
        propval = The category of the [gid.gtksource5.mark.Mark], classifies the mark and controls
          which pixbuf is used and with which priority it is drawn.
      Returns: Builder instance for fluent chaining
  */
  T category(string propval) nothrow
  {
    return setProperty("category", propval);
  }
}

/// Fluent builder for [gid.gtksource5.mark.Mark]
final class MarkGidBuilder : MarkGidBuilderImpl!MarkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Mark build() nothrow
  {
    return new Mark(cast(void*)createGObject(Mark._getGType), Yes.Take);
  }
}
