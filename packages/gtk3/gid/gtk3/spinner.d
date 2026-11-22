/// Module for [Spinner] class
module gid.gtk3.spinner;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A GtkSpinner widget displays an icon-size spinning animation.
    It is often used as an alternative to a #GtkProgressBar for
    displaying indefinite activity, instead of actual progress.
    
    To start the animation, use [gid.gtk4.spinner.Spinner.start], to stop it
    use [gid.gtk4.spinner.Spinner.stop].
    
    # CSS nodes
    
    GtkSpinner has a single CSS node with the name spinner. When the animation is
    active, the :checked pseudoclass is added to this node.
*/
class Spinner : gid.gtk3.widget.Widget
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
      Get builder for [gid.gtk3.spinner.Spinner]
      Returns: New builder object
  */
  static SpinnerGidBuilder builder() nothrow
  {
    return new SpinnerGidBuilder;
  }

  /** */
  @property bool active() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("active");
  }

  /** */
  @property void active(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Returns a new spinner widget. Not yet started.
      Returns: a new #GtkSpinner
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_spinner_new();
    this(_cretval, No.Take);
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

/// Fluent builder implementation template for [gid.gtk3.spinner.Spinner]
class SpinnerGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T
{


  /** */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }
}

/// Fluent builder for [gid.gtk3.spinner.Spinner]
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
