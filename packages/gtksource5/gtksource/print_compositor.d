/// Module for [PrintCompositor] class
module gtksource.print_compositor;

import gid.gid;
import gobject.object;
import gtk.print_context;
import gtk.text_tag;
import gtk.types;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
    Compose a `class@Buffer` for printing.
    
    The [gtksource.print_compositor.PrintCompositor] object is used to compose a `class@Buffer`
    for printing. You can set various configuration options to customize the
    printed output. [gtksource.print_compositor.PrintCompositor] is designed to be used with the
    high-level printing API of gtk+, i.e. [gtk.print_operation.PrintOperation].
    
    The margins specified in this object are the layout margins: they define the
    blank space bordering the printed area of the pages. They must not be
    confused with the "print margins", i.e. the parts of the page that the
    printer cannot print on, defined in the [gtk.page_setup.PageSetup] objects. If the
    specified layout margins are smaller than the "print margins", the latter
    ones are used as a fallback by the [gtksource.print_compositor.PrintCompositor] object, so that
    the printed area is not clipped.
*/
class PrintCompositor : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_print_compositor_get_type != &gidSymbolNotFound ? gtk_source_print_compositor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintCompositor self()
  {
    return this;
  }

  /**
      Get `bodyFontName` property.
      Returns: Name of the font used for the text body.
      
      Accepted values are strings representing a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property string bodyFontName()
  {
    return getBodyFontName();
  }

  /**
      Set `bodyFontName` property.
      Params:
        propval = Name of the font used for the text body.
        
        Accepted values are strings representing a font description Pango can understand.
        (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
        for a description of the format of the string representation.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void bodyFontName(string propval)
  {
    return setBodyFontName(propval);
  }

  /**
      Get `footerFontName` property.
      Returns: Name of the font used to print page footer.
      If this property is unspecified, the text body font is used.
      
      Accepted values are strings representing a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property string footerFontName()
  {
    return getFooterFontName();
  }

  /**
      Set `footerFontName` property.
      Params:
        propval = Name of the font used to print page footer.
        If this property is unspecified, the text body font is used.
        
        Accepted values are strings representing a font description Pango can understand.
        (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
        for a description of the format of the string representation.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void footerFontName(string propval)
  {
    return setFooterFontName(propval);
  }

  /**
      Get `headerFontName` property.
      Returns: Name of the font used to print page header.
      If this property is unspecified, the text body font is used.
      
      Accepted values are strings representing a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property string headerFontName()
  {
    return getHeaderFontName();
  }

  /**
      Set `headerFontName` property.
      Params:
        propval = Name of the font used to print page header.
        If this property is unspecified, the text body font is used.
        
        Accepted values are strings representing a font description Pango can understand.
        (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
        for a description of the format of the string representation.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void headerFontName(string propval)
  {
    return setHeaderFontName(propval);
  }

  /**
      Get `highlightSyntax` property.
      Returns: Whether to print the document with highlighted syntax.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property bool highlightSyntax()
  {
    return getHighlightSyntax();
  }

  /**
      Set `highlightSyntax` property.
      Params:
        propval = Whether to print the document with highlighted syntax.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void highlightSyntax(bool propval)
  {
    return setHighlightSyntax(propval);
  }

  /**
      Get `lineNumbersFontName` property.
      Returns: Name of the font used to print line numbers on the left margin.
      If this property is unspecified, the text body font is used.
      
      Accepted values are strings representing a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property string lineNumbersFontName()
  {
    return getLineNumbersFontName();
  }

  /**
      Set `lineNumbersFontName` property.
      Params:
        propval = Name of the font used to print line numbers on the left margin.
        If this property is unspecified, the text body font is used.
        
        Accepted values are strings representing a font description Pango can understand.
        (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
        for a description of the format of the string representation.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void lineNumbersFontName(string propval)
  {
    return setLineNumbersFontName(propval);
  }

  /**
      Get `nPages` property.
      Returns: The number of pages in the document or <code>-1</code> if the
      document has not been completely paginated.
  */
  @property int nPages()
  {
    return getNPages();
  }

  /**
      Get `printFooter` property.
      Returns: Whether to print a footer in each page.
      
      Note that by default the footer format is unspecified, and if it is
      unspecified the footer will not be printed, regardless of the value of
      this property.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property bool printFooter()
  {
    return getPrintFooter();
  }

  /**
      Set `printFooter` property.
      Params:
        propval = Whether to print a footer in each page.
        
        Note that by default the footer format is unspecified, and if it is
        unspecified the footer will not be printed, regardless of the value of
        this property.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void printFooter(bool propval)
  {
    return setPrintFooter(propval);
  }

  /**
      Get `printHeader` property.
      Returns: Whether to print a header in each page.
      
      Note that by default the header format is unspecified, and if it is
      unspecified the header will not be printed, regardless of the value of
      this property.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property bool printHeader()
  {
    return getPrintHeader();
  }

  /**
      Set `printHeader` property.
      Params:
        propval = Whether to print a header in each page.
        
        Note that by default the header format is unspecified, and if it is
        unspecified the header will not be printed, regardless of the value of
        this property.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void printHeader(bool propval)
  {
    return setPrintHeader(propval);
  }

  /**
      Get `printLineNumbers` property.
      Returns: Interval of printed line numbers.
      
      If this property is set to 0 no numbers will be printed.
      If greater than 0, a number will be printed every "print-line-numbers"
      lines (i.e. 1 will print all line numbers).
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property uint printLineNumbers()
  {
    return getPrintLineNumbers();
  }

  /**
      Set `printLineNumbers` property.
      Params:
        propval = Interval of printed line numbers.
        
        If this property is set to 0 no numbers will be printed.
        If greater than 0, a number will be printed every "print-line-numbers"
        lines (i.e. 1 will print all line numbers).
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void printLineNumbers(uint propval)
  {
    return setPrintLineNumbers(propval);
  }

  /**
      Get `tabWidth` property.
      Returns: Width of a tab character expressed in spaces.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property uint tabWidth()
  {
    return getTabWidth();
  }

  /**
      Set `tabWidth` property.
      Params:
        propval = Width of a tab character expressed in spaces.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void tabWidth(uint propval)
  {
    return setTabWidth(propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Whether to wrap lines never, at word boundaries, or at character boundaries.
      
      The value of this property cannot be changed anymore after the first
      call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property gtk.types.WrapMode wrapMode()
  {
    return getWrapMode();
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or at character boundaries.
        
        The value of this property cannot be changed anymore after the first
        call to the [gtksource.print_compositor.PrintCompositor.paginate] function.
  */
  @property void wrapMode(gtk.types.WrapMode propval)
  {
    return setWrapMode(propval);
  }

  /**
      Creates a new print compositor that can be used to print buffer.
  
      Params:
        buffer = the #GtkSourceBuffer to print.
      Returns: a new print compositor object.
  */
  this(gtksource.buffer.Buffer buffer)
  {
    GtkSourcePrintCompositor* _cretval;
    _cretval = gtk_source_print_compositor_new(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new print compositor that can be used to print the buffer
      associated with view.
      
      This constructor sets some configuration properties to make the
      printed output match view as much as possible.  The properties set are
      `propertyPrintCompositor:tab-width`, `propertyPrintCompositor:highlight-syntax`,
      `propertyPrintCompositor:wrap-mode`, `propertyPrintCompositor:body-font-name` and
      `propertyPrintCompositor:print-line-numbers`.
  
      Params:
        view = a #GtkSourceView to get configuration from.
      Returns: a new print compositor object.
  */
  static gtksource.print_compositor.PrintCompositor newFromView(gtksource.view.View view)
  {
    GtkSourcePrintCompositor* _cretval;
    _cretval = gtk_source_print_compositor_new_from_view(view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.print_compositor.PrintCompositor)(cast(GtkSourcePrintCompositor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Draw page page_nr for printing on the the Cairo context encapsuled in context.
      
      This method has been designed to be called in the handler of the `signalGtk.PrintOperation::draw_page` signal
      as shown in the following example:
      
      ```c
      // Signal handler for the GtkPrintOperation::draw_page signal
      
      static void
      draw_page (GtkPrintOperation *operation,
                 GtkPrintContext   *context,
                 gint               page_nr,
                 gpointer           user_data)
      {
          GtkSourcePrintCompositor *compositor;
      
          compositor = GTK_SOURCE_PRINT_COMPOSITOR (user_data);
      
          gtk_source_print_compositor_draw_page (compositor,
                                                 context,
                                                 page_nr);
      }
      ```
  
      Params:
        context = the #GtkPrintContext encapsulating the context information that is required when
                    drawing the page for printing.
        pageNr = the number of the page to print.
  */
  void drawPage(gtk.print_context.PrintContext context, int pageNr)
  {
    gtk_source_print_compositor_draw_page(cast(GtkSourcePrintCompositor*)this._cPtr, context ? cast(GtkPrintContext*)context._cPtr(No.Dup) : null, pageNr);
  }

  /**
      Returns the name of the font used to print the text body.
      
      The returned string must be freed with [glib.global.gfree].
      Returns: a new string containing the name of the font used to print the
        text body.
  */
  string getBodyFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_body_font_name(cast(GtkSourcePrintCompositor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the bottom margin in units of unit.
  
      Params:
        unit = the unit for the return value.
      Returns: the bottom margin.
  */
  double getBottomMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_bottom_margin(cast(GtkSourcePrintCompositor*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the `classBuffer` associated with the compositor.
      
      The returned object reference is owned by the compositor object and
      should not be unreferenced.
      Returns: the #GtkSourceBuffer associated with the compositor.
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_print_compositor_get_buffer(cast(GtkSourcePrintCompositor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the font used to print the page footer.
      
      The returned string must be freed with [glib.global.gfree].
      Returns: a new string containing the name of the font used to print
        the page footer.
  */
  string getFooterFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_footer_font_name(cast(GtkSourcePrintCompositor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the name of the font used to print the page header.
      
      The returned string must be freed with [glib.global.gfree].
      Returns: a new string containing the name of the font used to print
        the page header.
  */
  string getHeaderFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_header_font_name(cast(GtkSourcePrintCompositor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Determines whether the printed text will be highlighted according to the
      buffer rules.
      
      Note that highlighting will happen only if the buffer to print has highlighting activated.
      Returns: true if the printed output will be highlighted.
  */
  bool getHighlightSyntax()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_print_compositor_get_highlight_syntax(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Gets the left margin in units of unit.
  
      Params:
        unit = the unit for the return value.
      Returns: the left margin
  */
  double getLeftMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_left_margin(cast(GtkSourcePrintCompositor*)this._cPtr, unit);
    return _retval;
  }

  /**
      Returns the name of the font used to print line numbers on the left margin.
      
      The returned string must be freed with [glib.global.gfree].
      Returns: a new string containing the name of the font used to print
        line numbers on the left margin.
  */
  string getLineNumbersFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_line_numbers_font_name(cast(GtkSourcePrintCompositor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the number of pages in the document or <code>-1</code> if the
      document has not been completely paginated.
      Returns: the number of pages in the document or <code>-1</code> if the
        document has not been completely paginated.
  */
  int getNPages()
  {
    int _retval;
    _retval = gtk_source_print_compositor_get_n_pages(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current fraction of the document pagination that has been completed.
      Returns: a fraction from 0.0 to 1.0 inclusive.
  */
  double getPaginationProgress()
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_pagination_progress(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Determines if a footer is set to be printed for each page.
      
      A footer will be printed if this function returns true
      **and** some format strings have been specified
      with [gtksource.print_compositor.PrintCompositor.setFooterFormat].
      Returns: true if the footer is set to be printed.
  */
  bool getPrintFooter()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_print_compositor_get_print_footer(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Determines if a header is set to be printed for each page.
      
      A header will be printed if this function returns true
      **and** some format strings have been specified
      with [gtksource.print_compositor.PrintCompositor.setHeaderFormat].
      Returns: true if the header is set to be printed.
  */
  bool getPrintHeader()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_print_compositor_get_print_header(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Returns the interval used for line number printing.
      
      If the value is 0, no line numbers will be printed. The default value is
      1 (i.e. numbers printed in all lines).
      Returns: the interval of printed line numbers.
  */
  uint getPrintLineNumbers()
  {
    uint _retval;
    _retval = gtk_source_print_compositor_get_print_line_numbers(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Gets the right margin in units of unit.
  
      Params:
        unit = the unit for the return value.
      Returns: the right margin.
  */
  double getRightMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_right_margin(cast(GtkSourcePrintCompositor*)this._cPtr, unit);
    return _retval;
  }

  /**
      Returns the width of tabulation in characters for printed text.
      Returns: width of tab.
  */
  uint getTabWidth()
  {
    uint _retval;
    _retval = gtk_source_print_compositor_get_tab_width(cast(GtkSourcePrintCompositor*)this._cPtr);
    return _retval;
  }

  /**
      Gets the top margin in units of unit.
  
      Params:
        unit = the unit for the return value.
      Returns: the top margin.
  */
  double getTopMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_top_margin(cast(GtkSourcePrintCompositor*)this._cPtr, unit);
    return _retval;
  }

  /**
      Gets the line wrapping mode for the printed text.
      Returns: the line wrap mode.
  */
  gtk.types.WrapMode getWrapMode()
  {
    GtkWrapMode _cretval;
    _cretval = gtk_source_print_compositor_get_wrap_mode(cast(GtkSourcePrintCompositor*)this._cPtr);
    gtk.types.WrapMode _retval = cast(gtk.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Specifies a tag whose style should be ignored when compositing the
      document to the printable page.
  
      Params:
        tag = a #GtkTextTag
  */
  void ignoreTag(gtk.text_tag.TextTag tag)
  {
    gtk_source_print_compositor_ignore_tag(cast(GtkSourcePrintCompositor*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Paginate the document associated with the compositor.
      
      In order to support non-blocking pagination, document is paginated in small chunks.
      Each time [gtksource.print_compositor.PrintCompositor.paginate] is invoked, a chunk of the document
      is paginated. To paginate the entire document, [gtksource.print_compositor.PrintCompositor.paginate]
      must be invoked multiple times.
      It returns true if the document has been completely paginated, otherwise it returns false.
      
      This method has been designed to be invoked in the handler of the [gtk.print_operation.PrintOperation.paginate] signal,
      as shown in the following example:
      
      ```c
      // Signal handler for the GtkPrintOperation::paginate signal
      
      static gboolean
      paginate (GtkPrintOperation *operation,
                GtkPrintContext   *context,
                gpointer           user_data)
      {
          GtkSourcePrintCompositor *compositor;
      
          compositor = GTK_SOURCE_PRINT_COMPOSITOR (user_data);
      
          if (gtk_source_print_compositor_paginate (compositor, context))
          {
              gint n_pages;
      
              n_pages = gtk_source_print_compositor_get_n_pages (compositor);
              gtk_print_operation_set_n_pages (operation, n_pages);
      
              return TRUE;
          }
      
          return FALSE;
      }
      ```
      
      If you don't need to do pagination in chunks, you can simply do it all in the
      `signalGtk.PrintOperation::begin-print` handler, and set the number of pages from there, like
      in the following example:
      
      ```c
      // Signal handler for the GtkPrintOperation::begin-print signal
      
      static void
      begin_print (GtkPrintOperation *operation,
                   GtkPrintContext   *context,
                   gpointer           user_data)
      {
          GtkSourcePrintCompositor *compositor;
          gint n_pages;
      
          compositor = GTK_SOURCE_PRINT_COMPOSITOR (user_data);
      
          while (!gtk_source_print_compositor_paginate (compositor, context));
      
          n_pages = gtk_source_print_compositor_get_n_pages (compositor);
          gtk_print_operation_set_n_pages (operation, n_pages);
      }
      ```
  
      Params:
        context = the #GtkPrintContext whose parameters (e.g. paper size, print margins, etc.)
          are used by the the compositor to paginate the document.
      Returns: true if the document has been completely paginated, false otherwise.
  */
  bool paginate(gtk.print_context.PrintContext context)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_print_compositor_paginate(cast(GtkSourcePrintCompositor*)this._cPtr, context ? cast(GtkPrintContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the default font for the printed text.
      
      font_name should be a
      string representation of a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        fontName = the name of the default font for the body text.
  */
  void setBodyFontName(string fontName)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_body_font_name(cast(GtkSourcePrintCompositor*)this._cPtr, _fontName);
  }

  /**
      Sets the bottom margin used by compositor.
  
      Params:
        margin = the new bottom margin in units of unit.
        unit = the units for margin.
  */
  void setBottomMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_bottom_margin(cast(GtkSourcePrintCompositor*)this._cPtr, margin, unit);
  }

  /**
      Sets the font for printing the page footer.
      
      If null is supplied, the default font (i.e. the one being used for the
      text) will be used instead.
      
      font_name should be a
      string representation of a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        fontName = the name of the font for the footer text, or null.
  */
  void setFooterFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_footer_font_name(cast(GtkSourcePrintCompositor*)this._cPtr, _fontName);
  }

  /**
      See [gtksource.print_compositor.PrintCompositor.setHeaderFormat] for more information
      about the parameters.
  
      Params:
        separator = true if you want a separator line to be printed.
        left = a format string to print on the left of the footer.
        center = a format string to print on the center of the footer.
        right = a format string to print on the right of the footer.
  */
  void setFooterFormat(bool separator, string left = null, string center = null, string right = null)
  {
    const(char)* _left = left.toCString(No.Alloc);
    const(char)* _center = center.toCString(No.Alloc);
    const(char)* _right = right.toCString(No.Alloc);
    gtk_source_print_compositor_set_footer_format(cast(GtkSourcePrintCompositor*)this._cPtr, separator, _left, _center, _right);
  }

  /**
      Sets the font for printing the page header.
      
      If null is supplied, the default font (i.e. the one being used for the
      text) will be used instead.
      
      font_name should be a
      string representation of a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        fontName = the name of the font for header text, or null.
  */
  void setHeaderFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_header_font_name(cast(GtkSourcePrintCompositor*)this._cPtr, _fontName);
  }

  /**
      Sets strftime like header format strings, to be printed on the
      left, center and right of the top of each page.
      
      The strings may include strftime(3) codes which will be expanded at print time.
      A subset of strftime() codes are accepted, see [glib.date_time.DateTime.format]
      for more details on the accepted format specifiers.
      Additionally the following format specifiers are accepted:
      
      $(LIST
        * #N: the page number
        * #Q: the page count.
      )
        
      separator specifies if a solid line should be drawn to separate
      the header from the document text.
      
      If null is given for any of the three arguments, that particular
      string will not be printed.
      
      For the header to be printed, in
      addition to specifying format strings, you need to enable header
      printing with [gtksource.print_compositor.PrintCompositor.setPrintHeader].
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        separator = true if you want a separator line to be printed.
        left = a format string to print on the left of the header.
        center = a format string to print on the center of the header.
        right = a format string to print on the right of the header.
  */
  void setHeaderFormat(bool separator, string left = null, string center = null, string right = null)
  {
    const(char)* _left = left.toCString(No.Alloc);
    const(char)* _center = center.toCString(No.Alloc);
    const(char)* _right = right.toCString(No.Alloc);
    gtk_source_print_compositor_set_header_format(cast(GtkSourcePrintCompositor*)this._cPtr, separator, _left, _center, _right);
  }

  /**
      Sets whether the printed text will be highlighted according to the
      buffer rules.  Both color and font style are applied.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        highlight = whether syntax should be highlighted.
  */
  void setHighlightSyntax(bool highlight)
  {
    gtk_source_print_compositor_set_highlight_syntax(cast(GtkSourcePrintCompositor*)this._cPtr, highlight);
  }

  /**
      Sets the left margin used by compositor.
  
      Params:
        margin = the new left margin in units of unit.
        unit = the units for margin.
  */
  void setLeftMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_left_margin(cast(GtkSourcePrintCompositor*)this._cPtr, margin, unit);
  }

  /**
      Sets the font for printing line numbers on the left margin.
      
      If null is supplied, the default font (i.e. the one being used for the
      text) will be used instead.
      
      font_name should be a
      string representation of a font description Pango can understand.
      (e.g. &quot;Monospace 10&quot;). See [pango.font_description.FontDescription.fromString]
      for a description of the format of the string representation.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        fontName = the name of the font for line numbers, or null.
  */
  void setLineNumbersFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_line_numbers_font_name(cast(GtkSourcePrintCompositor*)this._cPtr, _fontName);
  }

  /**
      Sets whether you want to print a footer in each page.
      
      The footer consists of three pieces of text and an optional line
      separator, configurable with
      [gtksource.print_compositor.PrintCompositor.setFooterFormat].
      
      Note that by default the footer format is unspecified, and if it's
      empty it will not be printed, regardless of this setting.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        print = true if you want the footer to be printed.
  */
  void setPrintFooter(bool print)
  {
    gtk_source_print_compositor_set_print_footer(cast(GtkSourcePrintCompositor*)this._cPtr, print);
  }

  /**
      Sets whether you want to print a header in each page.
      
      The header consists of three pieces of text and an optional line
      separator, configurable with [gtksource.print_compositor.PrintCompositor.setHeaderFormat].
      
      Note that by default the header format is unspecified, and if it's
      empty it will not be printed, regardless of this setting.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        print = true if you want the header to be printed.
  */
  void setPrintHeader(bool print)
  {
    gtk_source_print_compositor_set_print_header(cast(GtkSourcePrintCompositor*)this._cPtr, print);
  }

  /**
      Sets the interval for printed line numbers.
      
      If interval is 0 no numbers will be printed. If greater than 0, a number will be
      printed every interval lines (i.e. 1 will print all line numbers).
      
      Maximum accepted value for interval is 100.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        interval = interval for printed line numbers.
  */
  void setPrintLineNumbers(uint interval)
  {
    gtk_source_print_compositor_set_print_line_numbers(cast(GtkSourcePrintCompositor*)this._cPtr, interval);
  }

  /**
      Sets the right margin used by compositor.
  
      Params:
        margin = the new right margin in units of unit.
        unit = the units for margin.
  */
  void setRightMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_right_margin(cast(GtkSourcePrintCompositor*)this._cPtr, margin, unit);
  }

  /**
      Sets the width of tabulation in characters for printed text.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        width = width of tab in characters.
  */
  void setTabWidth(uint width)
  {
    gtk_source_print_compositor_set_tab_width(cast(GtkSourcePrintCompositor*)this._cPtr, width);
  }

  /**
      Sets the top margin used by compositor.
  
      Params:
        margin = the new top margin in units of unit
        unit = the units for margin
  */
  void setTopMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_top_margin(cast(GtkSourcePrintCompositor*)this._cPtr, margin, unit);
  }

  /**
      Sets the line wrapping mode for the printed text.
      
      This function cannot be called anymore after the first call to the
      [gtksource.print_compositor.PrintCompositor.paginate] function.
  
      Params:
        wrapMode = a #GtkWrapMode.
  */
  void setWrapMode(gtk.types.WrapMode wrapMode)
  {
    gtk_source_print_compositor_set_wrap_mode(cast(GtkSourcePrintCompositor*)this._cPtr, wrapMode);
  }
}
