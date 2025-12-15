/// Module for [PrintContext] class
module gtk.print_context;

import cairo.context;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.types;
import pango.context;
import pango.font_map;
import pango.layout;

/**
    A [gtk.print_context.PrintContext] encapsulates context information that is required when
    drawing pages for printing.
    
    This includes the cairo context and important parameters like page size
    and resolution. It also lets you easily create [pango.layout.Layout] and
    [pango.context.Context] objects that match the font metrics of the cairo surface.
    
    [gtk.print_context.PrintContext] objects get passed to the
    `signal@Gtk.PrintOperation::begin-print`,
    `signal@Gtk.PrintOperation::end-print`,
    `signal@Gtk.PrintOperation::request-page-setup` and
    `signal@Gtk.PrintOperation::draw-page` signals on the
    [gtk.print_operation.PrintOperation] object.
    
    ## Using GtkPrintContext in a ::draw-page callback
    
    ```c
    static void
    draw_page (GtkPrintOperation *operation,
               GtkPrintContext   *context,
               int                page_nr)
    {
      cairo_t *cr;
      PangoLayout *layout;
      PangoFontDescription *desc;
    
      cr = gtk_print_context_get_cairo_context (context);
    
      // Draw a red rectangle, as wide as the paper (inside the margins)
      cairo_set_source_rgb (cr, 1.0, 0, 0);
      cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);
    
      cairo_fill (cr);
    
      // Draw some lines
      cairo_move_to (cr, 20, 10);
      cairo_line_to (cr, 40, 20);
      cairo_arc (cr, 60, 60, 20, 0, M_PI);
      cairo_line_to (cr, 80, 20);
    
      cairo_set_source_rgb (cr, 0, 0, 0);
      cairo_set_line_width (cr, 5);
      cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);
      cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);
    
      cairo_stroke (cr);
    
      // Draw some text
      layout = gtk_print_context_create_pango_layout (context);
      pango_layout_set_text (layout, "Hello World! Printing is easy", -1);
      desc = pango_font_description_from_string ("sans 28");
      pango_layout_set_font_description (layout, desc);
      pango_font_description_free (desc);
    
      cairo_move_to (cr, 30, 20);
      pango_cairo_layout_path (cr, layout);
    
      // Font Outline
      cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);
      cairo_set_line_width (cr, 0.5);
      cairo_stroke_preserve (cr);
    
      // Font Fill
      cairo_set_source_rgb (cr, 0, 0.0, 1.0);
      cairo_fill (cr);
    
      g_object_unref (layout);
    }
    ```
*/
class PrintContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_print_context_get_type != &gidSymbolNotFound ? gtk_print_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PrintContext self()
  {
    return this;
  }

  /**
      Creates a new [pango.context.Context] that can be used with the
      [gtk.print_context.PrintContext].
      Returns: a new Pango context for context
  */
  pango.context.Context createPangoContext()
  {
    PangoContext* _cretval;
    _cretval = gtk_print_context_create_pango_context(cast(GtkPrintContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [pango.layout.Layout] that is suitable for use
      with the [gtk.print_context.PrintContext].
      Returns: a new Pango layout for context
  */
  pango.layout.Layout createPangoLayout()
  {
    PangoLayout* _cretval;
    _cretval = gtk_print_context_create_pango_layout(cast(GtkPrintContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains the cairo context that is associated with the
      [gtk.print_context.PrintContext].
      Returns: the cairo context of context
  */
  cairo.context.Context getCairoContext()
  {
    cairo_t* _cretval;
    _cretval = gtk_print_context_get_cairo_context(cast(GtkPrintContext*)this._cPtr);
    auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the horizontal resolution of the [gtk.print_context.PrintContext],
      in dots per inch.
      Returns: the horizontal resolution of context
  */
  double getDpiX()
  {
    double _retval;
    _retval = gtk_print_context_get_dpi_x(cast(GtkPrintContext*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the vertical resolution of the [gtk.print_context.PrintContext],
      in dots per inch.
      Returns: the vertical resolution of context
  */
  double getDpiY()
  {
    double _retval;
    _retval = gtk_print_context_get_dpi_y(cast(GtkPrintContext*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the hardware printer margins of the [gtk.print_context.PrintContext],
      in units.
  
      Params:
        top = top hardware printer margin
        bottom = bottom hardware printer margin
        left = left hardware printer margin
        right = right hardware printer margin
      Returns: true if the hard margins were retrieved
  */
  bool getHardMargins(out double top, out double bottom, out double left, out double right)
  {
    bool _retval;
    _retval = cast(bool)gtk_print_context_get_hard_margins(cast(GtkPrintContext*)this._cPtr, cast(double*)&top, cast(double*)&bottom, cast(double*)&left, cast(double*)&right);
    return _retval;
  }

  /**
      Obtains the height of the [gtk.print_context.PrintContext], in pixels.
      Returns: the height of context
  */
  double getHeight()
  {
    double _retval;
    _retval = gtk_print_context_get_height(cast(GtkPrintContext*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the [gtk.page_setup.PageSetup] that determines the page
      dimensions of the [gtk.print_context.PrintContext].
      Returns: the page setup of context
  */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_context_get_page_setup(cast(GtkPrintContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [pango.font_map.FontMap] that is suitable for use
      with the [gtk.print_context.PrintContext].
      Returns: the font map of context
  */
  pango.font_map.FontMap getPangoFontmap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_print_context_get_pango_fontmap(cast(GtkPrintContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the width of the [gtk.print_context.PrintContext], in pixels.
      Returns: the width of context
  */
  double getWidth()
  {
    double _retval;
    _retval = gtk_print_context_get_width(cast(GtkPrintContext*)this._cPtr);
    return _retval;
  }

  /**
      Sets a new cairo context on a print context.
      
      This function is intended to be used when implementing
      an internal print preview, it is not needed for printing,
      since GTK itself creates a suitable cairo context in that
      case.
  
      Params:
        cr = the cairo context
        dpiX = the horizontal resolution to use with cr
        dpiY = the vertical resolution to use with cr
  */
  void setCairoContext(cairo.context.Context cr, double dpiX, double dpiY)
  {
    gtk_print_context_set_cairo_context(cast(GtkPrintContext*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, dpiX, dpiY);
  }
}
