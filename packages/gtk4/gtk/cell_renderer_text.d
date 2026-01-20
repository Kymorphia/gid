/// Module for [CellRendererText] class
module gtk.cell_renderer_text;

import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;
import pango.attr_list;
import pango.font_description;
import pango.types;

/**
    Renders text in a cell
    
    A [gtk.cell_renderer_text.CellRendererText] renders a given text in its cell, using the font, color and
    style information provided by its properties. The text will be ellipsized if it is
    too long and the `GtkCellRendererText:ellipsize` property allows it.
    
    If the `GtkCellRenderer:mode` is [gtk.types.CellRendererMode.Editable],
    the [gtk.cell_renderer_text.CellRendererText] allows to edit its text using an entry.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.inscription.Inscription] or [gtk.label.Label] instead
*/
class CellRendererText : gtk.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_text_get_type != &gidSymbolNotFound ? gtk_cell_renderer_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererText self()
  {
    return this;
  }

  /** */
  @property bool alignSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("align-set");
  }

  /** */
  @property void alignSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("align-set", propval);
  }

  /**
      Get `alignment` property.
      Returns: Specifies how to align the lines of text with respect to each other.
        
        Note that this property describes how to align the lines of text in
        case there are several of them. The "xalign" property of [gtk.cell_renderer.CellRenderer],
        on the other hand, sets the horizontal alignment of the whole text.
  */
  @property pango.types.Alignment alignment()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Alignment)("alignment");
  }

  /**
      Set `alignment` property.
      Params:
        propval = Specifies how to align the lines of text with respect to each other.
          
          Note that this property describes how to align the lines of text in
          case there are several of them. The "xalign" property of [gtk.cell_renderer.CellRenderer],
          on the other hand, sets the horizontal alignment of the whole text.
  */
  @property void alignment(pango.types.Alignment propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Alignment)("alignment", propval);
  }

  /** */
  @property pango.attr_list.AttrList attributes()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.attr_list.AttrList)("attributes");
  }

  /** */
  @property void attributes(pango.attr_list.AttrList propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.attr_list.AttrList)("attributes", propval);
  }

  /** */
  @property void background(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a [gdk.rgba.RGBA]
  */
  @property gdk.rgba.RGBA backgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gdk.rgba.RGBA]
  */
  @property void backgroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /** */
  @property bool editable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
  @property void editable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool editableSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable-set");
  }

  /** */
  @property void editableSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable-set", propval);
  }

  /**
      Get `ellipsize` property.
      Returns: Specifies the preferred place to ellipsize the string, if the cell renderer
        does not have enough room to display the entire string. Setting it to
        [pango.types.EllipsizeMode.None] turns off ellipsizing. See the wrap-width property
        for another way of making the text fit into a given width.
  */
  @property pango.types.EllipsizeMode ellipsize()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.EllipsizeMode)("ellipsize");
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = Specifies the preferred place to ellipsize the string, if the cell renderer
          does not have enough room to display the entire string. Setting it to
          [pango.types.EllipsizeMode.None] turns off ellipsizing. See the wrap-width property
          for another way of making the text fit into a given width.
  */
  @property void ellipsize(pango.types.EllipsizeMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.EllipsizeMode)("ellipsize", propval);
  }

  /** */
  @property bool ellipsizeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ellipsize-set");
  }

  /** */
  @property void ellipsizeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ellipsize-set", propval);
  }

  /** */
  @property string family()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("family");
  }

  /** */
  @property void family(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("family", propval);
  }

  /** */
  @property bool familySet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("family-set");
  }

  /** */
  @property void familySet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("family-set", propval);
  }

  /** */
  @property string font()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("font");
  }

  /** */
  @property void font(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /** */
  @property pango.font_description.FontDescription fontDesc()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /** */
  @property void fontDesc(pango.font_description.FontDescription propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.font_description.FontDescription)("font-desc", propval);
  }

  /** */
  @property void foreground(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a [gdk.rgba.RGBA]
  */
  @property gdk.rgba.RGBA foregroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gdk.rgba.RGBA]
  */
  @property void foregroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("foreground-rgba", propval);
  }

  /** */
  @property bool foregroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property void foregroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("foreground-set", propval);
  }

  /** */
  @property string language()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("language");
  }

  /** */
  @property void language(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("language", propval);
  }

  /** */
  @property bool languageSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("language-set");
  }

  /** */
  @property void languageSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("language-set", propval);
  }

  /** */
  @property void markup(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("markup", propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the cell, in characters. If this property
        is set to -1, the width will be calculated automatically.
        
        For cell renderers that ellipsize or wrap text; this property
        controls the maximum reported width of the cell. The
        cell should not receive any greater allocation unless it is
        set to expand in its [gtk.cell_layout.CellLayout] and all of the cell's siblings
        have received their natural width.
  */
  @property int maxWidthChars()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-width-chars");
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the cell, in characters. If this property
          is set to -1, the width will be calculated automatically.
          
          For cell renderers that ellipsize or wrap text; this property
          controls the maximum reported width of the cell. The
          cell should not receive any greater allocation unless it is
          set to expand in its [gtk.cell_layout.CellLayout] and all of the cell's siblings
          have received their natural width.
  */
  @property void maxWidthChars(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-width-chars", propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.cell_renderer.CellRenderer] if
        `GtkCellRendererText:editable` is true and the cell is empty.
  */
  @property string placeholderText()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("placeholder-text");
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.cell_renderer.CellRenderer] if
          `GtkCellRendererText:editable` is true and the cell is empty.
  */
  @property void placeholderText(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("placeholder-text", propval);
  }

  /** */
  @property int rise()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rise");
  }

  /** */
  @property void rise(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("rise", propval);
  }

  /** */
  @property bool riseSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("rise-set");
  }

  /** */
  @property void riseSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("rise-set", propval);
  }

  /** */
  @property double scale()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("scale");
  }

  /** */
  @property void scale(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("scale", propval);
  }

  /** */
  @property bool scaleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property void scaleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("scale-set", propval);
  }

  /** */
  @property bool singleParagraphMode()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("single-paragraph-mode");
  }

  /** */
  @property void singleParagraphMode(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("single-paragraph-mode", propval);
  }

  /** */
  @property int size()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("size");
  }

  /** */
  @property void size(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /** */
  @property double sizePoints()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /** */
  @property void sizePoints(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("size-points", propval);
  }

  /** */
  @property bool sizeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("size-set");
  }

  /** */
  @property void sizeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("size-set", propval);
  }

  /** */
  @property pango.types.Stretch stretch()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Stretch)("stretch");
  }

  /** */
  @property void stretch(pango.types.Stretch propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Stretch)("stretch", propval);
  }

  /** */
  @property bool stretchSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("stretch-set");
  }

  /** */
  @property void stretchSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("stretch-set", propval);
  }

  /** */
  @property bool strikethrough()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property void strikethrough(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /** */
  @property bool strikethroughSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property void strikethroughSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough-set", propval);
  }

  /** */
  @property pango.types.Style style()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Style)("style");
  }

  /** */
  @property void style(pango.types.Style propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Style)("style", propval);
  }

  /** */
  @property bool styleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("style-set");
  }

  /** */
  @property void styleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("style-set", propval);
  }

  /** */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /** */
  @property pango.types.Underline underline()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("underline");
  }

  /** */
  @property void underline(pango.types.Underline propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Underline)("underline", propval);
  }

  /** */
  @property bool underlineSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property void underlineSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("underline-set", propval);
  }

  /** */
  @property pango.types.Variant variant()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Variant)("variant");
  }

  /** */
  @property void variant(pango.types.Variant propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Variant)("variant", propval);
  }

  /** */
  @property bool variantSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("variant-set");
  }

  /** */
  @property void variantSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("variant-set", propval);
  }

  /** */
  @property int weight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("weight");
  }

  /** */
  @property void weight(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("weight", propval);
  }

  /** */
  @property bool weightSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /** */
  @property void weightSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("weight-set", propval);
  }

  /**
      Get `widthChars` property.
      Returns: The desired width of the cell, in characters. If this property is set to
        -1, the width will be calculated automatically, otherwise the cell will
        request either 3 characters or the property value, whichever is greater.
  */
  @property int widthChars()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("width-chars");
  }

  /**
      Set `widthChars` property.
      Params:
        propval = The desired width of the cell, in characters. If this property is set to
          -1, the width will be calculated automatically, otherwise the cell will
          request either 3 characters or the property value, whichever is greater.
  */
  @property void widthChars(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("width-chars", propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Specifies how to break the string into multiple lines, if the cell
        renderer does not have enough room to display the entire string.
        This property has no effect unless the wrap-width property is set.
  */
  @property pango.types.WrapMode wrapMode()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.WrapMode)("wrap-mode");
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Specifies how to break the string into multiple lines, if the cell
          renderer does not have enough room to display the entire string.
          This property has no effect unless the wrap-width property is set.
  */
  @property void wrapMode(pango.types.WrapMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.WrapMode)("wrap-mode", propval);
  }

  /**
      Get `wrapWidth` property.
      Returns: Specifies the minimum width at which the text is wrapped. The wrap-mode property can
        be used to influence at what character positions the line breaks can be placed.
        Setting wrap-width to -1 turns wrapping off.
  */
  @property int wrapWidth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("wrap-width");
  }

  /**
      Set `wrapWidth` property.
      Params:
        propval = Specifies the minimum width at which the text is wrapped. The wrap-mode property can
          be used to influence at what character positions the line breaks can be placed.
          Setting wrap-width to -1 turns wrapping off.
  */
  @property void wrapWidth(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("wrap-width", propval);
  }

  /**
      Creates a new [gtk.cell_renderer_text.CellRendererText]. Adjust how text is drawn using
      object properties. Object properties can be
      set globally (with [gobject.object.ObjectWrap.set]). Also, with [gtk.tree_view_column.TreeViewColumn],
      you can bind a property to a value in a [gtk.tree_model.TreeModel]. For example,
      you can bind the “text” property on the cell renderer to a string
      value in the model, thus rendering a different string in each row
      of the [gtk.tree_view.TreeView].
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_text_new();
    this(_cretval, No.Take);
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
  void setFixedHeightFromFont(int numberOfRows)
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
  
          $(D void callback(string path, string newText, gtk.cell_renderer_text.CellRendererText cellRendererText))
  
          `path` the path identifying the edited cell (optional)
  
          `newText` the new text (optional)
  
          `cellRendererText` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEdited(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.cell_renderer_text.CellRendererText)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edited", closure, after);
  }
}
