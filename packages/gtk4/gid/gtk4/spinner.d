/// Module for [Spinner] class
module gid.gtk4.spinner;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Displays an icon-size spinning animation.
    
    It is often used as an alternative to a [gid.gtk4.progress_bar.ProgressBar]
    for displaying indefinite activity, instead of actual progress.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkSpinner" src="spinner.png">
    </picture>
    
    To start the animation, use [gid.gtk4.spinner.Spinner.start], to stop it
    use [gid.gtk4.spinner.Spinner.stop].
    
    # CSS nodes
    
    [gid.gtk4.spinner.Spinner] has a single CSS node with the name spinner.
    When the animation is active, the :checked pseudoclass is
    added to this node.
    
    # Accessibility
    
    [gid.gtk4.spinner.Spinner] uses the [gid.gtk4.types.AccessibleRole.ProgressBar] role.
*/
@gidGir("Spinner")
class Spinner : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_spinner_get_type != &gidSymbolNotFound ? gtk_spinner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSpinner";
  }

  /** Returns `this`, for use in `with` statements. */
  override Spinner self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.spinner.Spinner]
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
      Returns: a new [gid.gtk4.spinner.Spinner]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_spinner_new();
      this(_cretval, No.Take);
    }
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

/// Fluent builder implementation template for [gid.gtk4.spinner.Spinner]
class SpinnerGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
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

/// Fluent builder for [gid.gtk4.spinner.Spinner]
final class SpinnerGidBuilder : SpinnerGidBuilderImpl!SpinnerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Spinner build() nothrow
  {
    return new Spinner(cast(void*)createGObject(Spinner._getGType), Yes.Take);
  }
}
