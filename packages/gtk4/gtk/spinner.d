/// Module for [Spinner] class
module gtk.spinner;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.spinner.Spinner] widget displays an icon-size spinning animation.
    
    It is often used as an alternative to a [gtk.progress_bar.ProgressBar]
    for displaying indefinite activity, instead of actual progress.
    
    ![An example GtkSpinner](spinner.png)
    
    To start the animation, use [gtk.spinner.Spinner.start], to stop it
    use [gtk.spinner.Spinner.stop].
    
    # CSS nodes
    
    [gtk.spinner.Spinner] has a single CSS node with the name spinner.
    When the animation is active, the :checked pseudoclass is
    added to this node.
*/
class Spinner : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_spinner_get_type != &gidSymbolNotFound ? gtk_spinner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Spinner self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.spinner.Spinner]
      Returns: New builder object
  */
  static SpinnerGidBuilder builder() nothrow
  {
    return new SpinnerGidBuilder;
  }

  /**
      Get `spinning` property.
      Returns: Whether the spinner is spinning
  */
  @property bool spinning() nothrow
  {
    return getSpinning();
  }

  /**
      Set `spinning` property.
      Params:
        propval = Whether the spinner is spinning
  */
  @property void spinning(bool propval) nothrow
  {
    setSpinning(propval);
  }

  /**
      Returns a new spinner widget. Not yet started.
      Returns: a new [gtk.spinner.Spinner]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_spinner_new();
    this(_cretval, No.Take);
  }

  /**
      Returns whether the spinner is spinning.
      Returns: true if the spinner is active
  */
  bool getSpinning() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_spinner_get_spinning(cast(GtkSpinner*)this._cPtr);
    return _retval;
  }

  /**
      Sets the activity of the spinner.
  
      Params:
        spinning = whether the spinner should be spinning
  */
  void setSpinning(bool spinning) nothrow
  {
    gtk_spinner_set_spinning(cast(GtkSpinner*)this._cPtr, spinning);
  }

  /**
      Starts the animation of the spinner.
  */
  void start() nothrow
  {
    gtk_spinner_start(cast(GtkSpinner*)this._cPtr);
  }

  /**
      Stops the animation of the spinner.
  */
  void stop() nothrow
  {
    gtk_spinner_stop(cast(GtkSpinner*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gtk.spinner.Spinner]
class SpinnerGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `spinning` property.
      Params:
        propval = Whether the spinner is spinning
      Returns: Builder instance for fluent chaining
  */
  T spinning(bool propval) nothrow
  {
    return setProperty("spinning", propval);
  }
}

/// Fluent builder for [gtk.spinner.Spinner]
final class SpinnerGidBuilder : SpinnerGidBuilderImpl!SpinnerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Spinner build() nothrow
  {
    return new Spinner(cast(void*)createGObject(Spinner._getGType), No.Take);
  }
}
