/// Module for [ProgressBar] class
module gtk.progress_bar;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;
import pango.types;

/**
    [gtk.progress_bar.ProgressBar] is typically used to display the progress of a long
    running operation.
    
    It provides a visual clue that processing is underway. [gtk.progress_bar.ProgressBar]
    can be used in two different modes: percentage mode and activity mode.
    
    ![An example GtkProgressBar](progressbar.png)
    
    When an application can determine how much work needs to take place
    (e.g. read a fixed number of bytes from a file) and can monitor its
    progress, it can use the [gtk.progress_bar.ProgressBar] in percentage mode and the
    user sees a growing bar indicating the percentage of the work that
    has been completed. In this mode, the application is required to call
    [gtk.progress_bar.ProgressBar.setFraction] periodically to update the progress bar.
    
    When an application has no accurate way of knowing the amount of work
    to do, it can use the [gtk.progress_bar.ProgressBar] in activity mode, which shows
    activity by a block moving back and forth within the progress area. In
    this mode, the application is required to call [gtk.progress_bar.ProgressBar.pulse]
    periodically to update the progress bar.
    
    There is quite a bit of flexibility provided to control the appearance
    of the [gtk.progress_bar.ProgressBar]. Functions are provided to control the orientation
    of the bar, optional text can be displayed along with the bar, and the
    step size used in activity mode can be set.
    
    # CSS nodes
    
    ```
    progressbar[.osd]
    ├── [text]
    ╰── trough[.empty][.full]
        ╰── progress[.pulse]
    ```
    
    [gtk.progress_bar.ProgressBar] has a main CSS node with name progressbar and subnodes with
    names text and trough, of which the latter has a subnode named progress. The
    text subnode is only present if text is shown. The progress subnode has the
    style class .pulse when in activity mode. It gets the style classes .left,
    .right, .top or .bottom added when the progress 'touches' the corresponding
    end of the GtkProgressBar. The .osd class on the progressbar node is for use
    in overlays like the one Epiphany has for page loading progress.
    
    # Accessibility
    
    [gtk.progress_bar.ProgressBar] uses the [gtk.types.AccessibleRole.ProgressBar] role.
*/
class ProgressBar : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
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
      Returns: The preferred place to ellipsize the string.
        
        The text will be ellipsized if the progress bar does not have enough room
        to display the entire string, specified as a [pango.types.EllipsizeMode].
        
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
        propval = The preferred place to ellipsize the string.
          
          The text will be ellipsized if the progress bar does not have enough room
          to display the entire string, specified as a [pango.types.EllipsizeMode].
          
          Note that setting this property to a value other than
          [pango.types.EllipsizeMode.None] has the side-effect that the progress bar requests
          only enough space to display the ellipsis ("..."). Another means to set a
          progress bar's width is [gtk.widget.Widget.setSizeRequest].
  */
  @property void ellipsize(pango.types.EllipsizeMode propval)
  {
    return setEllipsize(propval);
  }

  /**
      Get `fraction` property.
      Returns: The fraction of total work that has been completed.
  */
  @property double fraction()
  {
    return getFraction();
  }

  /**
      Set `fraction` property.
      Params:
        propval = The fraction of total work that has been completed.
  */
  @property void fraction(double propval)
  {
    return setFraction(propval);
  }

  /**
      Get `inverted` property.
      Returns: Invert the direction in which the progress bar grows.
  */
  @property bool inverted()
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Invert the direction in which the progress bar grows.
  */
  @property void inverted(bool propval)
  {
    return setInverted(propval);
  }

  /**
      Get `pulseStep` property.
      Returns: The fraction of total progress to move the bounding block when pulsed.
  */
  @property double pulseStep()
  {
    return getPulseStep();
  }

  /**
      Set `pulseStep` property.
      Params:
        propval = The fraction of total progress to move the bounding block when pulsed.
  */
  @property void pulseStep(double propval)
  {
    return setPulseStep(propval);
  }

  /**
      Get `showText` property.
      Returns: Sets whether the progress bar will show a text in addition
        to the bar itself.
        
        The shown text is either the value of the [gtk.progress_bar.ProgressBar.text]
        property or, if that is null, the [gtk.progress_bar.ProgressBar.fraction]
        value, as a percentage.
        
        To make a progress bar that is styled and sized suitably for showing text
        (even if the actual text is blank), set `property@Gtk.ProgressBar:show-text`
        to true and [gtk.progress_bar.ProgressBar.text] to the empty string (not null).
  */
  @property bool showText()
  {
    return getShowText();
  }

  /**
      Set `showText` property.
      Params:
        propval = Sets whether the progress bar will show a text in addition
          to the bar itself.
          
          The shown text is either the value of the [gtk.progress_bar.ProgressBar.text]
          property or, if that is null, the [gtk.progress_bar.ProgressBar.fraction]
          value, as a percentage.
          
          To make a progress bar that is styled and sized suitably for showing text
          (even if the actual text is blank), set `property@Gtk.ProgressBar:show-text`
          to true and [gtk.progress_bar.ProgressBar.text] to the empty string (not null).
  */
  @property void showText(bool propval)
  {
    return setShowText(propval);
  }

  /**
      Get `text` property.
      Returns: Text to be displayed in the progress bar.
  */
  @property string text()
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = Text to be displayed in the progress bar.
  */
  @property void text(string propval)
  {
    return setText(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new [gtk.progress_bar.ProgressBar].
      Returns: a [gtk.progress_bar.ProgressBar].
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
      Returns: [pango.types.EllipsizeMode]
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
      Returns whether the progress bar is inverted.
      Returns: true if the progress bar is inverted
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)gtk_progress_bar_get_inverted(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the pulse step.
      
      See [gtk.progress_bar.ProgressBar.setPulseStep].
      Returns: a fraction from 0.0 to 1.0
  */
  double getPulseStep()
  {
    double _retval;
    _retval = gtk_progress_bar_get_pulse_step(cast(GtkProgressBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gtk.progress_bar.ProgressBar] shows text.
      
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
      Retrieves the text that is displayed with the progress bar.
      
      The return value is a reference to the text, not a copy of it,
      so will become invalid if you change the text in the progress bar.
      Returns: the text
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
      Sets the mode used to ellipsize the text.
      
      The text is ellipsized if there is not enough space
      to render the entire string.
  
      Params:
        mode = a [pango.types.EllipsizeMode]
  */
  void setEllipsize(pango.types.EllipsizeMode mode)
  {
    gtk_progress_bar_set_ellipsize(cast(GtkProgressBar*)this._cPtr, mode);
  }

  /**
      Causes the progress bar to “fill in” the given fraction
      of the bar.
      
      The fraction should be between 0.0 and 1.0, inclusive.
  
      Params:
        fraction = fraction of the task that’s been completed
  */
  void setFraction(double fraction)
  {
    gtk_progress_bar_set_fraction(cast(GtkProgressBar*)this._cPtr, fraction);
  }

  /**
      Sets whether the progress bar is inverted.
      
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
      bouncing block.
      
      The bouncing block is moved when [gtk.progress_bar.ProgressBar.pulse]
      is called.
  
      Params:
        fraction = fraction between 0.0 and 1.0
  */
  void setPulseStep(double fraction)
  {
    gtk_progress_bar_set_pulse_step(cast(GtkProgressBar*)this._cPtr, fraction);
  }

  /**
      Sets whether the progress bar will show text next to the bar.
      
      The shown text is either the value of the [gtk.progress_bar.ProgressBar.text]
      property or, if that is null, the [gtk.progress_bar.ProgressBar.fraction] value,
      as a percentage.
      
      To make a progress bar that is styled and sized suitably for containing
      text (even if the actual text is blank), set `propertyGtk.ProgressBar:show-text`
      to true and [gtk.progress_bar.ProgressBar.text] to the empty string (not null).
  
      Params:
        showText = whether to show text
  */
  void setShowText(bool showText)
  {
    gtk_progress_bar_set_show_text(cast(GtkProgressBar*)this._cPtr, showText);
  }

  /**
      Causes the given text to appear next to the progress bar.
      
      If text is null and `propertyGtk.ProgressBar:show-text` is true,
      the current value of [gtk.progress_bar.ProgressBar.fraction] will be displayed
      as a percentage.
      
      If text is non-null and `propertyGtk.ProgressBar:show-text` is true,
      the text will be displayed. In this case, it will not display the progress
      percentage. If text is the empty string, the progress bar will still
      be styled and sized suitably for containing text, as long as
      `propertyGtk.ProgressBar:show-text` is true.
  
      Params:
        text = a UTF-8 string
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_progress_bar_set_text(cast(GtkProgressBar*)this._cPtr, _text);
  }
}
