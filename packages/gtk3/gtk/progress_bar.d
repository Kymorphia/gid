/// Module for [ProgressBar] class
module gtk.progress_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;
import pango.types;

/**
    The #GtkProgressBar is typically used to display the progress of a long
    running operation. It provides a visual clue that processing is underway.
    The GtkProgressBar can be used in two different modes: percentage mode
    and activity mode.
    
    When an application can determine how much work needs to take place
    (e.g. read a fixed number of bytes from a file) and can monitor its
    progress, it can use the GtkProgressBar in percentage mode and the
    user sees a growing bar indicating the percentage of the work that
    has been completed. In this mode, the application is required to call
    [gtk.progress_bar.ProgressBar.setFraction] periodically to update the progress bar.
    
    When an application has no accurate way of knowing the amount of work
    to do, it can use the #GtkProgressBar in activity mode, which shows
    activity by a block moving back and forth within the progress area. In
    this mode, the application is required to call [gtk.progress_bar.ProgressBar.pulse]
    periodically to update the progress bar.
    
    There is quite a bit of flexibility provided to control the appearance
    of the #GtkProgressBar. Functions are provided to control the orientation
    of the bar, optional text can be displayed along with the bar, and the
    step size used in activity mode can be set.
    
    # CSS nodes
    
    ```plain
    progressbar[.osd]
    ├── [text]
    ╰── trough[.empty][.full]
        ╰── progress[.pulse]
    ```
    
    GtkProgressBar has a main CSS node with name progressbar and subnodes with
    names text and trough, of which the latter has a subnode named progress. The
    text subnode is only present if text is shown. The progress subnode has the
    style class .pulse when in activity mode. It gets the style classes .left,
    .right, .top or .bottom added when the progress 'touches' the corresponding
    end of the GtkProgressBar. The .osd class on the progressbar node is for use
    in overlays like the one Epiphany has for page loading progress.
*/
class ProgressBar : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_progress_bar_get_type != &gidSymbolNotFound ? gtk_progress_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ProgressBar self()
  {
    return this;
  }

  /**
      Get `ellipsize` property.
      Returns: The preferred place to ellipsize the string, if the progress bar does
      not have enough room to display the entire string, specified as a
      #PangoEllipsizeMode.
      
      Note that setting this property to a value other than
      [pango.types.EllipsizeMode.None] has the side-effect that the progress bar requests
      only enough space to display the ellipsis ("..."). Another means to set a
      progress bar's width is [gtk.widget.Widget.setSizeRequest].
  */
  @property pango.types.EllipsizeMode ellipsize()
  {
    return getEllipsize();
  }

  /**
      Set `ellipsize` property.
      Params:
        propval = The preferred place to ellipsize the string, if the progress bar does
        not have enough room to display the entire string, specified as a
        #PangoEllipsizeMode.
        
        Note that setting this property to a value other than
        [pango.types.EllipsizeMode.None] has the side-effect that the progress bar requests
        only enough space to display the ellipsis ("..."). Another means to set a
        progress bar's width is [gtk.widget.Widget.setSizeRequest].
  */
  @property void ellipsize(pango.types.EllipsizeMode propval)
  {
    return setEllipsize(propval);
  }

  /** */
  @property double fraction()
  {
    return getFraction();
  }

  /** */
  @property void fraction(double propval)
  {
    return setFraction(propval);
  }

  /** */
  @property bool inverted()
  {
    return getInverted();
  }

  /** */
  @property void inverted(bool propval)
  {
    return setInverted(propval);
  }

  /** */
  @property double pulseStep()
  {
    return getPulseStep();
  }

  /** */
  @property void pulseStep(double propval)
  {
    return setPulseStep(propval);
  }

  /**
      Get `showText` property.
      Returns: Sets whether the progress bar will show a text in addition
      to the bar itself. The shown text is either the value of
      the #GtkProgressBar:text property or, if that is null,
      the #GtkProgressBar:fraction value, as a percentage.
      
      To make a progress bar that is styled and sized suitably for
      showing text (even if the actual text is blank), set
      #GtkProgressBar:show-text to true and #GtkProgressBar:text
      to the empty string (not null).
  */
  @property bool showText()
  {
    return getShowText();
  }

  /**
      Set `showText` property.
      Params:
        propval = Sets whether the progress bar will show a text in addition
        to the bar itself. The shown text is either the value of
        the #GtkProgressBar:text property or, if that is null,
        the #GtkProgressBar:fraction value, as a percentage.
        
        To make a progress bar that is styled and sized suitably for
        showing text (even if the actual text is blank), set
        #GtkProgressBar:show-text to true and #GtkProgressBar:text
        to the empty string (not null).
  */
  @property void showText(bool propval)
  {
    return setShowText(propval);
  }

  /** */
  @property string text()
  {
    return getText();
  }

  /** */
  @property void text(string propval)
  {
    return setText(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkProgressBar.
      Returns: a #GtkProgressBar.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_progress_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Returns the ellipsizing position of the progress bar.
      See [gtk.progress_bar.ProgressBar.setEllipsize].
      Returns: #PangoEllipsizeMode
  */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_progress_bar_get_ellipsize(cast(GtkProgressBar*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Returns the current fraction of the task that’s been completed.
      Returns: a fraction from 0.0 to 1.0
  */
  double getFraction()
  {
    double _retval;
    _retval = gtk_progress_bar_get_fraction(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.progress_bar.ProgressBar.setInverted].
      Returns: true if the progress bar is inverted
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)gtk_progress_bar_get_inverted(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the pulse step set with [gtk.progress_bar.ProgressBar.setPulseStep].
      Returns: a fraction from 0.0 to 1.0
  */
  double getPulseStep()
  {
    double _retval;
    _retval = gtk_progress_bar_get_pulse_step(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkProgressBar:show-text property.
      See [gtk.progress_bar.ProgressBar.setShowText].
      Returns: true if text is shown in the progress bar
  */
  bool getShowText()
  {
    bool _retval;
    _retval = cast(bool)gtk_progress_bar_get_show_text(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the text that is displayed with the progress bar,
      if any, otherwise null. The return value is a reference
      to the text, not a copy of it, so will become invalid
      if you change the text in the progress bar.
      Returns: text, or null; this string is owned by the widget
        and should not be modified or freed.
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_progress_bar_get_text(cast(GtkProgressBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Indicates that some progress has been made, but you don’t know how much.
      Causes the progress bar to enter “activity mode,” where a block
      bounces back and forth. Each call to [gtk.progress_bar.ProgressBar.pulse]
      causes the block to move by a little bit (the amount of movement
      per pulse is determined by [gtk.progress_bar.ProgressBar.setPulseStep]).
  */
  void pulse()
  {
    gtk_progress_bar_pulse(cast(GtkProgressBar*)this._cPtr);
  }

  /**
      Sets the mode used to ellipsize (add an ellipsis: "...") the
      text if there is not enough space to render the entire string.
  
      Params:
        mode = a #PangoEllipsizeMode
  */
  void setEllipsize(pango.types.EllipsizeMode mode)
  {
    gtk_progress_bar_set_ellipsize(cast(GtkProgressBar*)this._cPtr, mode);
  }

  /**
      Causes the progress bar to “fill in” the given fraction
      of the bar. The fraction should be between 0.0 and 1.0,
      inclusive.
  
      Params:
        fraction = fraction of the task that’s been completed
  */
  void setFraction(double fraction)
  {
    gtk_progress_bar_set_fraction(cast(GtkProgressBar*)this._cPtr, fraction);
  }

  /**
      Progress bars normally grow from top to bottom or left to right.
      Inverted progress bars grow in the opposite direction.
  
      Params:
        inverted = true to invert the progress bar
  */
  void setInverted(bool inverted)
  {
    gtk_progress_bar_set_inverted(cast(GtkProgressBar*)this._cPtr, inverted);
  }

  /**
      Sets the fraction of total progress bar length to move the
      bouncing block for each call to [gtk.progress_bar.ProgressBar.pulse].
  
      Params:
        fraction = fraction between 0.0 and 1.0
  */
  void setPulseStep(double fraction)
  {
    gtk_progress_bar_set_pulse_step(cast(GtkProgressBar*)this._cPtr, fraction);
  }

  /**
      Sets whether the progress bar will show text next to the bar.
      The shown text is either the value of the #GtkProgressBar:text
      property or, if that is null, the #GtkProgressBar:fraction value,
      as a percentage.
      
      To make a progress bar that is styled and sized suitably for containing
      text (even if the actual text is blank), set #GtkProgressBar:show-text to
      true and #GtkProgressBar:text to the empty string (not null).
  
      Params:
        showText = whether to show text
  */
  void setShowText(bool showText)
  {
    gtk_progress_bar_set_show_text(cast(GtkProgressBar*)this._cPtr, showText);
  }

  /**
      Causes the given text to appear next to the progress bar.
      
      If text is null and #GtkProgressBar:show-text is true, the current
      value of #GtkProgressBar:fraction will be displayed as a percentage.
      
      If text is non-null and #GtkProgressBar:show-text is true, the text
      will be displayed. In this case, it will not display the progress
      percentage. If text is the empty string, the progress bar will still
      be styled and sized suitably for containing text, as long as
      #GtkProgressBar:show-text is true.
  
      Params:
        text = a UTF-8 string, or null
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_progress_bar_set_text(cast(GtkProgressBar*)this._cPtr, _text);
  }
}
