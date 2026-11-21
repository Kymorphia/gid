/// Module for [GutterLines] class
module gid.gtksource5.gutter_lines;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_buffer;
import gid.gtk4.text_iter;
import gid.gtk4.text_view;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Collected information about visible lines.
    
    The [gid.gtksource5.gutter_lines.GutterLines] object is used to collect information about
    visible lines.
    
    Use this from your [gid.gtksource5.gutter_renderer.GutterRenderer.queryData] to collect the
    necessary information on visible lines. Doing so reduces the number of
    passes through the text btree allowing GtkSourceView to reach more
    frames-per-second while performing kinetic scrolling.
*/
class GutterLines : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_lines_get_type != &gidSymbolNotFound ? gtk_source_gutter_lines_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceGutterLines";
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterLines self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.gutter_lines.GutterLines]
      Returns: New builder object
  */
  static GutterLinesGidBuilder builder() nothrow
  {
    return new GutterLinesGidBuilder;
  }

  /**
      Adds the class name to line.
      
      name will be converted to a [gid.glib2.types.uint] as part of this process. A
      faster version of this function is available via
      [gid.gtksource5.gutter_lines.GutterLines.addQclass] for situations where the [gid.glib2.types.uint] is
      known ahead of time.
  
      Params:
        line = a line number starting from zero
        name = a class name
  */
  void addClass(uint line, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_source_gutter_lines_add_class(cast(GtkSourceGutterLines*)this._cPtr, line, _name);
  }

  /**
      Adds the class denoted by qname to line.
      
      You may check if a line has qname by calling
      [gid.gtksource5.gutter_lines.GutterLines.hasQclass].
      
      You can remove qname by calling
      [gid.gtksource5.gutter_lines.GutterLines.removeQclass].
  
      Params:
        line = a line number starting from zero
        qname = a class name as a #GQuark
  */
  void addQclass(uint line, gid.glib2.types.Quark qname) nothrow
  {
    gtk_source_gutter_lines_add_qclass(cast(GtkSourceGutterLines*)this._cPtr, line, qname);
  }

  /**
      Gets the [gid.gtk4.text_buffer.TextBuffer] that the [gid.gtksource5.gutter_lines.GutterLines] represents.
      Returns: a #GtkTextBuffer
  */
  gid.gtk4.text_buffer.TextBuffer getBuffer() nothrow
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_source_gutter_lines_get_buffer(cast(GtkSourceGutterLines*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the line number (starting from 0) for the first line that is
      user visible.
      Returns: a line number starting from 0
  */
  uint getFirst() nothrow
  {
    uint _retval;
    _retval = gtk_source_gutter_lines_get_first(cast(GtkSourceGutterLines*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #GtkTextIter for the current buffer at line
  
      Params:
        iter = a location for a #GtkTextIter
        line = the line number
  */
  void getIterAtLine(out gid.gtk4.text_iter.TextIter iter, uint line) nothrow
  {
    auto _iter = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    gtk_source_gutter_lines_get_iter_at_line(cast(GtkSourceGutterLines*)this._cPtr, _iter, line);
    iter = new gid.gtk4.text_iter.TextIter(cast(void*)_iter, Yes.Take);
  }

  /**
      Gets the line number (starting from 0) for the last line that is
      user visible.
      Returns: a line number starting from 0
  */
  uint getLast() nothrow
  {
    uint _retval;
    _retval = gtk_source_gutter_lines_get_last(cast(GtkSourceGutterLines*)this._cPtr);
    return _retval;
  }

  /**
      Gets the Y range for a line based on mode.
      
      The value for `y` is relative to the renderers widget coordinates.
  
      Params:
        line = a line number starting from zero
        mode = a #GtkSourceGutterRendererAlignmentMode
        y = a location for the Y position in widget coordinates
        height = the line height based on mode
  */
  void getLineExtent(uint line, gid.gtksource5.types.GutterRendererAlignmentMode mode, out double y, out double height) nothrow
  {
    gtk_source_gutter_lines_get_line_extent(cast(GtkSourceGutterLines*)this._cPtr, line, mode, cast(double*)&y, cast(double*)&height);
  }

  /**
      Gets the Y range for a line based on mode.
      
      The value for `y` is relative to the renderers widget coordinates.
  
      Params:
        line = a line number starting from zero
        mode = a #GtkSourceGutterRendererAlignmentMode
        y = a location for the Y position in widget coordinates
        height = the line height based on mode
  */
  void getLineYrange(uint line, gid.gtksource5.types.GutterRendererAlignmentMode mode, out int y, out int height) nothrow
  {
    gtk_source_gutter_lines_get_line_yrange(cast(GtkSourceGutterLines*)this._cPtr, line, mode, cast(int*)&y, cast(int*)&height);
  }

  /**
      Gets the [gid.gtk4.text_view.TextView] that the [gid.gtksource5.gutter_lines.GutterLines] represents.
      Returns: a #GtkTextView
  */
  gid.gtk4.text_view.TextView getView() nothrow
  {
    GtkTextView* _cretval;
    _cretval = gtk_source_gutter_lines_get_view(cast(GtkSourceGutterLines*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_view.TextView)(cast(GtkTextView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks to see if the line has any GQuark classes set. This can be
      used to help renderer implementations avoid work if nothing has
      been set on the class.
  
      Params:
        line = a line contained within lines
      Returns: true if any quark was set for the line
  */
  bool hasAnyClass(uint line) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_lines_has_any_class(cast(GtkSourceGutterLines*)this._cPtr, line);
    return _retval;
  }

  /**
      Checks to see if [gid.gtksource5.gutter_lines.GutterLines.addClass] was called with
      the name for line.
      
      A faster version of this function is provided via
      [gid.gtksource5.gutter_lines.GutterLines.hasQclass] for situations where the quark
      is known ahead of time.
  
      Params:
        line = a line number starting from zero
        name = a class name that may be converted, to a #GQuark
      Returns: true if line contains name
  */
  bool hasClass(uint line, string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_source_gutter_lines_has_class(cast(GtkSourceGutterLines*)this._cPtr, line, _name);
    return _retval;
  }

  /**
      Checks to see if [gid.gtksource5.gutter_lines.GutterLines.addQclass] was called with
      the quark denoted by qname for line.
  
      Params:
        line = a line number starting from zero
        qname = a #GQuark containing the class name
      Returns: true if line contains qname
  */
  bool hasQclass(uint line, gid.glib2.types.Quark qname) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_lines_has_qclass(cast(GtkSourceGutterLines*)this._cPtr, line, qname);
    return _retval;
  }

  /**
      Checks to see if line contains the insertion cursor.
  
      Params:
        line = a line number starting from zero
      Returns: true if the insertion cursor is on line
  */
  bool isCursor(uint line) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_lines_is_cursor(cast(GtkSourceGutterLines*)this._cPtr, line);
    return _retval;
  }

  /**
      Checks to see if line is marked as prelit. Generally, this means
      the mouse pointer is over the line within the gutter.
  
      Params:
        line = a line number starting from zero
      Returns: true if the line is prelit
  */
  bool isPrelit(uint line) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_lines_is_prelit(cast(GtkSourceGutterLines*)this._cPtr, line);
    return _retval;
  }

  /**
      Checks to see if the view had a selection and if that selection overlaps
      line in some way.
  
      Params:
        line = a line number starting from zero
      Returns: true if the line contains a selection
  */
  bool isSelected(uint line) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_lines_is_selected(cast(GtkSourceGutterLines*)this._cPtr, line);
    return _retval;
  }

  /**
      Removes the class matching name from line.
      
      A faster version of this function is available via
      [gid.gtksource5.gutter_lines.GutterLines.removeQclass] for situations where the
      #GQuark is known ahead of time.
  
      Params:
        line = a line number starting from zero
        name = a class name
  */
  void removeClass(uint line, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_source_gutter_lines_remove_class(cast(GtkSourceGutterLines*)this._cPtr, line, _name);
  }

  /**
      Reverses a call to [gid.gtksource5.gutter_lines.GutterLines.addQclass] by removing
      the [gid.glib2.types.uint] matching qname.
  
      Params:
        line = a line number starting from zero
        qname = a #GQuark to remove from line
  */
  void removeQclass(uint line, gid.glib2.types.Quark qname) nothrow
  {
    gtk_source_gutter_lines_remove_qclass(cast(GtkSourceGutterLines*)this._cPtr, line, qname);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.gutter_lines.GutterLines]
class GutterLinesGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.gutter_lines.GutterLines]
final class GutterLinesGidBuilder : GutterLinesGidBuilderImpl!GutterLinesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GutterLines build() nothrow
  {
    return new GutterLines(cast(void*)createGObject(GutterLines._getGType), Yes.Take);
  }
}
