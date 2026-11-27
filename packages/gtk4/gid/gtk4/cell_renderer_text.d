/// Module for [CellRendererText] class
module gid.gtk4.cell_renderer_text;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_renderer;
import gid.gtk4.types;
import gid.pango1.attr_list;
import gid.pango1.font_description;
import gid.pango1.types;

/**
    Renders text in a cell
    
    A [gid.gtk4.cell_renderer_text.CellRendererText] renders a given text in its cell, using the font, color and
    style information provided by its properties. The text will be ellipsized if it is
    too long and the `GtkCellRendererText:ellipsize` property allows it.
    
    If the `GtkCellRenderer:mode` is [gid.gtk4.types.CellRendererMode.Editable],
    the [gid.gtk4.cell_renderer_text.CellRendererText] allows to edit its text using an entry.

    Deprecated: List views use widgets to display their contents.
        You should use [gid.gtk4.inscription.Inscription] or [gid.gtk4.label.Label] instead
*/
@gidGir("CellRendererText", "CellRendererTextClass")
class CellRendererText : gid.gtk4.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_text_get_type != &gidSymbolNotFound ? gtk_cell_renderer_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererText";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererText self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.cell_renderer_text.CellRendererText]
      Returns: New builder object
  */
  static CellRendererTextGidBuilder builder() nothrow
  {
    return new CellRendererTextGidBuilder;
  }

  /** */
  @property bool alignSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("align-set");
  }

  /** */
  @property void alignSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("align-set", propval);
  }

  /**
      Get `alignment` property.
      Returns: Specifies how to align the lines of text with respect to each other.
        
        Note that this property describes how to align the lines of text in
        case there are several of them. The "xalign" property of [gid.gtk4.cell_renderer.CellRenderer],
        on the other hand, sets the horizontal alignment of the whole text.
  */
  @property gid.pango1.types.Alignment alignment() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Alignment)("alignment");
  }

  /**
      Set `alignment` property.
      Params:
        propval = Specifies how to align the lines of text with respect to each other.
          
          Note that this property describes how to align the lines of text in
          case there are several of them. The "xalign" property of [gid.gtk4.cell_renderer.CellRenderer],
          on the other hand, sets the horizontal alignment of the whole text.
  */
  @property void alignment(gid.pango1.types.Alignment propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.Alignment)("alignment", propval);
  }

  /** */
  @property gid.pango1.attr_list.AttrList attributes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.attr_list.AttrList)("attributes");
  }

  /** */
  @property void attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.attr_list.AttrList)("attributes", propval);
  }

  /** */
  @property void background(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a [gid.gdk4.rgba.RGBA]
  */
  @property gid.gdk4.rgba.RGBA backgroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gid.gdk4.rgba.RGBA]
  */
  @property void backgroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /** */
  @property bool editable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
  @property void editable(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool editableSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("editable-set");
  }

  /** */
  @property void editableSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("editable-set", propval);
  }

  /**
      Get `ellipsize` property.
      Returns: Specifies the preferred place to ellipsize the string, if the cell renderer
        does not have enough room to display the entire string. Setting it to
        [gid.pango1.types.EllipsizeMode.None] turns off ellipsizing. See the wrap-width property
        for another way of making the text fit into a given width.
  */
  @property gid.pango1.types.EllipsizeMode ellipsize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.EllipsizeMode)("ellipsize");
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = Specifies the preferred place to ellipsize the string, if the cell renderer
          does not have enough room to display the entire string. Setting it to
          [gid.pango1.types.EllipsizeMode.None] turns off ellipsizing. See the wrap-width property
          for another way of making the text fit into a given width.
  */
  @property void ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.EllipsizeMode)("ellipsize", propval);
  }

  /** */
  @property bool ellipsizeSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("ellipsize-set");
  }

  /** */
  @property void ellipsizeSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("ellipsize-set", propval);
  }

  /** */
  @property string family() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("family");
  }

  /** */
  @property void family(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("family", propval);
  }

  /** */
  @property bool familySet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("family-set");
  }

  /** */
  @property void familySet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("family-set", propval);
  }

  /** */
  @property string font() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("font");
  }

  /** */
  @property void font(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /** */
  @property gid.pango1.font_description.FontDescription fontDesc() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.font_description.FontDescription)("font-desc");
  }

  /** */
  @property void fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.font_description.FontDescription)("font-desc", propval);
  }

  /** */
  @property void foreground(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a [gid.gdk4.rgba.RGBA]
  */
  @property gid.gdk4.rgba.RGBA foregroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gid.gdk4.rgba.RGBA]
  */
  @property void foregroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.rgba.RGBA)("foreground-rgba", propval);
  }

  /** */
  @property bool foregroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property void foregroundSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("foreground-set", propval);
  }

  /** */
  @property string language() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("language");
  }

  /** */
  @property void language(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("language", propval);
  }

  /** */
  @property bool languageSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("language-set");
  }

  /** */
  @property void languageSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("language-set", propval);
  }

  /** */
  @property void markup(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("markup", propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the cell, in characters. If this property
        is set to -1, the width will be calculated automatically.
        
        For cell renderers that ellipsize or wrap text; this property
        controls the maximum reported width of the cell. The
        cell should not receive any greater allocation unless it is
        set to expand in its [gid.gtk4.cell_layout.CellLayout] and all of the cell's siblings
        have received their natural width.
  */
  @property int maxWidthChars() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-width-chars");
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the cell, in characters. If this property
          is set to -1, the width will be calculated automatically.
          
          For cell renderers that ellipsize or wrap text; this property
          controls the maximum reported width of the cell. The
          cell should not receive any greater allocation unless it is
          set to expand in its [gid.gtk4.cell_layout.CellLayout] and all of the cell's siblings
          have received their natural width.
  */
  @property void maxWidthChars(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("max-width-chars", propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gid.gtk4.cell_renderer.CellRenderer] if
        `GtkCellRendererText:editable` is true and the cell is empty.
  */
  @property string placeholderText() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("placeholder-text");
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gid.gtk4.cell_renderer.CellRenderer] if
          `GtkCellRendererText:editable` is true and the cell is empty.
  */
  @property void placeholderText(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("placeholder-text", propval);
  }

  /** */
  @property int rise() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("rise");
  }

  /** */
  @property void rise(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("rise", propval);
  }

  /** */
  @property bool riseSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("rise-set");
  }

  /** */
  @property void riseSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("rise-set", propval);
  }

  /** */
  @property double scale() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("scale");
  }

  /** */
  @property void scale(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("scale", propval);
  }

  /** */
  @property bool scaleSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property void scaleSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("scale-set", propval);
  }

  /** */
  @property bool singleParagraphMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("single-paragraph-mode");
  }

  /** */
  @property void singleParagraphMode(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("single-paragraph-mode", propval);
  }

  /** */
  @property int size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("size");
  }

  /** */
  @property void size(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /** */
  @property double sizePoints() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /** */
  @property void sizePoints(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("size-points", propval);
  }

  /** */
  @property bool sizeSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("size-set");
  }

  /** */
  @property void sizeSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("size-set", propval);
  }

  /** */
  @property gid.pango1.types.Stretch stretch() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Stretch)("stretch");
  }

  /** */
  @property void stretch(gid.pango1.types.Stretch propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.Stretch)("stretch", propval);
  }

  /** */
  @property bool stretchSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("stretch-set");
  }

  /** */
  @property void stretchSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("stretch-set", propval);
  }

  /** */
  @property bool strikethrough() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property void strikethrough(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /** */
  @property bool strikethroughSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property void strikethroughSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("strikethrough-set", propval);
  }

  /** */
  @property gid.pango1.types.Style style() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Style)("style");
  }

  /** */
  @property void style(gid.pango1.types.Style propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.Style)("style", propval);
  }

  /** */
  @property bool styleSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("style-set");
  }

  /** */
  @property void styleSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("style-set", propval);
  }

  /** */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /** */
  @property gid.pango1.types.Underline underline() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Underline)("underline");
  }

  /** */
  @property void underline(gid.pango1.types.Underline propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.Underline)("underline", propval);
  }

  /** */
  @property bool underlineSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property void underlineSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("underline-set", propval);
  }

  /** */
  @property gid.pango1.types.Variant variant() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Variant)("variant");
  }

  /** */
  @property void variant(gid.pango1.types.Variant propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.Variant)("variant", propval);
  }

  /** */
  @property bool variantSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("variant-set");
  }

  /** */
  @property void variantSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("variant-set", propval);
  }

  /** */
  @property int weight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("weight");
  }

  /** */
  @property void weight(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("weight", propval);
  }

  /** */
  @property bool weightSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /** */
  @property void weightSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("weight-set", propval);
  }

  /**
      Get `widthChars` property.
      Returns: The desired width of the cell, in characters. If this property is set to
        -1, the width will be calculated automatically, otherwise the cell will
        request either 3 characters or the property value, whichever is greater.
  */
  @property int widthChars() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("width-chars");
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the cell, in characters. If this property is set to
          -1, the width will be calculated automatically, otherwise the cell will
          request either 3 characters or the property value, whichever is greater.
  */
  @property void widthChars(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("width-chars", propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Specifies how to break the string into multiple lines, if the cell
        renderer does not have enough room to display the entire string.
        This property has no effect unless the wrap-width property is set.
  */
  @property gid.pango1.types.WrapMode wrapMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.WrapMode)("wrap-mode");
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Specifies how to break the string into multiple lines, if the cell
          renderer does not have enough room to display the entire string.
          This property has no effect unless the wrap-width property is set.
  */
  @property void wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.types.WrapMode)("wrap-mode", propval);
  }

  /**
      Get `wrapWidth` property.
      Returns: Specifies the minimum width at which the text is wrapped. The wrap-mode property can
        be used to influence at what character positions the line breaks can be placed.
        Setting wrap-width to -1 turns wrapping off.
  */
  @property int wrapWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("wrap-width");
  }

  /**
      Set `wrapWidth` property.
      Params:
        propval = Specifies the minimum width at which the text is wrapped. The wrap-mode property can
          be used to influence at what character positions the line breaks can be placed.
          Setting wrap-width to -1 turns wrapping off.
  */
  @property void wrapWidth(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("wrap-width", propval);
  }

  /**
      Creates a new [gid.gtk4.cell_renderer_text.CellRendererText]. Adjust how text is drawn using
      object properties. Object properties can be
      set globally (with [gid.gobject2.object.ObjectWrap.set]). Also, with [gid.gtk4.tree_view_column.TreeViewColumn],
      you can bind a property to a value in a [gid.gtk4.tree_model.TreeModel]. For example,
      you can bind the “text” property on the cell renderer to a string
      value in the model, thus rendering a different string in each row
      of the [gid.gtk4.tree_view.TreeView].
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_text_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncEdited(string path, string newText)
  {
    auto _klass = cast(GtkCellRendererTextClass*)_vfuncClass;
    if (!_klass.edited)
      return;

    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    const(char)* _newText = newText.toCString!(No.Malloc, No.Nullable);
    _klass.edited(cast(GtkCellRendererText*)this._cPtr, _path, _newText);
  }

  /**
      Sets the height of a renderer to explicitly be determined by the “font” and
      “y_pad” property set on it.  Further changes in these properties do not
      affect the height, so they must be accompanied by a subsequent call to this
      function.  Using this function is inflexible, and should really only be used
      if calculating the size of a cell is too slow (ie, a massive number of cells
      displayed).  If number_of_rows is -1, then the fixed height is unset, and
      the height is determined by the properties again.
  
      Params:
        numberOfRows = Number of rows of text each cell renderer is allocated, or -1
  */
  void setFixedHeightFromFont(int numberOfRows) nothrow
  {
    gtk_cell_renderer_text_set_fixed_height_from_font(cast(GtkCellRendererText*)this._cPtr, numberOfRows);
  }

  /**
      Connect to `Edited` signal.
  
      This signal is emitted after renderer has been edited.
        
        It is the responsibility of the application to update the model
        and store new_text at the position indicated by path.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string path, string newText, gid.gtk4.cell_renderer_text.CellRendererText cellRendererText)`
  
          `path` the path identifying the edited cell (optional)
  
          `newText` the new text (optional)
  
          `cellRendererText` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEdited(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.cell_renderer_text.CellRendererText)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer_text.CellRendererText.edited");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edited", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellRendererText
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.cell_renderer_text.CellRendererText), T.stringof ~ " is not derived from gid.gtk4.cell_renderer_text.CellRendererText");

    gid.gtk4.cell_renderer.CellRenderer._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEdited", true)[0]) == gid.gtk4.cell_renderer_text.CellRendererText))
      _installVfunc(klass, "edited");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellRendererTextClass*)klass;

    switch (vfunc)
    {
      case "edited":
      {
        static extern(C) void _vfuncEditedTramp(GtkCellRendererText* cellRendererText, const(char)* path, const(char)* newText) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.cell_renderer_text.CellRendererText)(cast(void*)cellRendererText);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererTextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellRendererText);
            if (_klass.edited)
              return (cast(typeof(&_vfuncEditedTramp))_klass.edited)(cellRendererText, path, newText);
            return;
          }

          string _path = path.fromCString!(No.Free);
          string _newText = newText.fromCString!(No.Free);

          try
          {
            _obj.vfuncEdited(_path, _newText);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer_text.CellRendererText.vfuncEdited");
          }
        }

        _klass.edited = cast(typeof(_klass.edited))&_vfuncEditedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.cell_renderer_text.CellRendererText]
class CellRendererTextGidBuilderImpl(T) : gid.gtk4.cell_renderer.CellRendererGidBuilderImpl!T
{

  /** */
  T alignSet(bool propval) nothrow
  {
    return setProperty("align-set", propval);
  }

  /**
      Set `alignment` property.
      Params:
        propval = Specifies how to align the lines of text with respect to each other.
          
          Note that this property describes how to align the lines of text in
          case there are several of them. The "xalign" property of [gid.gtk4.cell_renderer.CellRenderer],
          on the other hand, sets the horizontal alignment of the whole text.
      Returns: Builder instance for fluent chaining
  */
  T alignment(gid.pango1.types.Alignment propval) nothrow
  {
    return setProperty("alignment", propval);
  }

  /** */
  T attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /** */
  T background(string propval) nothrow
  {
    return setProperty("background", propval);
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gid.gdk4.rgba.RGBA]
      Returns: Builder instance for fluent chaining
  */
  T backgroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    return setProperty("background-rgba", propval);
  }

  /** */
  T backgroundSet(bool propval) nothrow
  {
    return setProperty("background-set", propval);
  }

  /** */
  T editable(bool propval) nothrow
  {
    return setProperty("editable", propval);
  }

  /** */
  T editableSet(bool propval) nothrow
  {
    return setProperty("editable-set", propval);
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = Specifies the preferred place to ellipsize the string, if the cell renderer
          does not have enough room to display the entire string. Setting it to
          [gid.pango1.types.EllipsizeMode.None] turns off ellipsizing. See the wrap-width property
          for another way of making the text fit into a given width.
      Returns: Builder instance for fluent chaining
  */
  T ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    return setProperty("ellipsize", propval);
  }

  /** */
  T ellipsizeSet(bool propval) nothrow
  {
    return setProperty("ellipsize-set", propval);
  }

  /** */
  T family(string propval) nothrow
  {
    return setProperty("family", propval);
  }

  /** */
  T familySet(bool propval) nothrow
  {
    return setProperty("family-set", propval);
  }

  /** */
  T font(string propval) nothrow
  {
    return setProperty("font", propval);
  }

  /** */
  T fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /** */
  T foreground(string propval) nothrow
  {
    return setProperty("foreground", propval);
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gid.gdk4.rgba.RGBA]
      Returns: Builder instance for fluent chaining
  */
  T foregroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    return setProperty("foreground-rgba", propval);
  }

  /** */
  T foregroundSet(bool propval) nothrow
  {
    return setProperty("foreground-set", propval);
  }

  /** */
  T language(string propval) nothrow
  {
    return setProperty("language", propval);
  }

  /** */
  T languageSet(bool propval) nothrow
  {
    return setProperty("language-set", propval);
  }

  /** */
  T markup(string propval) nothrow
  {
    return setProperty("markup", propval);
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the cell, in characters. If this property
          is set to -1, the width will be calculated automatically.
          
          For cell renderers that ellipsize or wrap text; this property
          controls the maximum reported width of the cell. The
          cell should not receive any greater allocation unless it is
          set to expand in its [gid.gtk4.cell_layout.CellLayout] and all of the cell's siblings
          have received their natural width.
      Returns: Builder instance for fluent chaining
  */
  T maxWidthChars(int propval) nothrow
  {
    return setProperty("max-width-chars", propval);
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gid.gtk4.cell_renderer.CellRenderer] if
          `GtkCellRendererText:editable` is true and the cell is empty.
      Returns: Builder instance for fluent chaining
  */
  T placeholderText(string propval) nothrow
  {
    return setProperty("placeholder-text", propval);
  }

  /** */
  T rise(int propval) nothrow
  {
    return setProperty("rise", propval);
  }

  /** */
  T riseSet(bool propval) nothrow
  {
    return setProperty("rise-set", propval);
  }

  /** */
  T scale(double propval) nothrow
  {
    return setProperty("scale", propval);
  }

  /** */
  T scaleSet(bool propval) nothrow
  {
    return setProperty("scale-set", propval);
  }

  /** */
  T singleParagraphMode(bool propval) nothrow
  {
    return setProperty("single-paragraph-mode", propval);
  }

  /** */
  T size(int propval) nothrow
  {
    return setProperty("size", propval);
  }

  /** */
  T sizePoints(double propval) nothrow
  {
    return setProperty("size-points", propval);
  }

  /** */
  T sizeSet(bool propval) nothrow
  {
    return setProperty("size-set", propval);
  }

  /** */
  T stretch(gid.pango1.types.Stretch propval) nothrow
  {
    return setProperty("stretch", propval);
  }

  /** */
  T stretchSet(bool propval) nothrow
  {
    return setProperty("stretch-set", propval);
  }

  /** */
  T strikethrough(bool propval) nothrow
  {
    return setProperty("strikethrough", propval);
  }

  /** */
  T strikethroughSet(bool propval) nothrow
  {
    return setProperty("strikethrough-set", propval);
  }

  /** */
  T style(gid.pango1.types.Style propval) nothrow
  {
    return setProperty("style", propval);
  }

  /** */
  T styleSet(bool propval) nothrow
  {
    return setProperty("style-set", propval);
  }

  /** */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /** */
  T underline(gid.pango1.types.Underline propval) nothrow
  {
    return setProperty("underline", propval);
  }

  /** */
  T underlineSet(bool propval) nothrow
  {
    return setProperty("underline-set", propval);
  }

  /** */
  T variant(gid.pango1.types.Variant propval) nothrow
  {
    return setProperty("variant", propval);
  }

  /** */
  T variantSet(bool propval) nothrow
  {
    return setProperty("variant-set", propval);
  }

  /** */
  T weight(int propval) nothrow
  {
    return setProperty("weight", propval);
  }

  /** */
  T weightSet(bool propval) nothrow
  {
    return setProperty("weight-set", propval);
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the cell, in characters. If this property is set to
          -1, the width will be calculated automatically, otherwise the cell will
          request either 3 characters or the property value, whichever is greater.
      Returns: Builder instance for fluent chaining
  */
  T widthChars(int propval) nothrow
  {
    return setProperty("width-chars", propval);
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Specifies how to break the string into multiple lines, if the cell
          renderer does not have enough room to display the entire string.
          This property has no effect unless the wrap-width property is set.
      Returns: Builder instance for fluent chaining
  */
  T wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }

  /**
      Set `wrapWidth` property.
      Params:
        propval = Specifies the minimum width at which the text is wrapped. The wrap-mode property can
          be used to influence at what character positions the line breaks can be placed.
          Setting wrap-width to -1 turns wrapping off.
      Returns: Builder instance for fluent chaining
  */
  T wrapWidth(int propval) nothrow
  {
    return setProperty("wrap-width", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_renderer_text.CellRendererText]
final class CellRendererTextGidBuilder : CellRendererTextGidBuilderImpl!CellRendererTextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererText build() nothrow
  {
    return new CellRendererText(cast(void*)createGObject(CellRendererText._getGType), Yes.Take);
  }
}
