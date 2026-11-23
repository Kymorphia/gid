/// Module for [ActionBar] class
module gid.gtk4.action_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
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
    Presents contextual actions.
    
    <picture>
      <source srcset="action-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkActionBar" src="action-bar.png">
    </picture>
    
    [gid.gtk4.action_bar.ActionBar] is expected to be displayed below the content and expand
    horizontally to fill the area.
    
    It allows placing children at the start or the end. In addition, it
    contains an internal centered box which is centered with respect to
    the full width of the box, even if the children at either side take
    up different amounts of space.
    
    # GtkActionBar as GtkBuildable
    
    The [gid.gtk4.action_bar.ActionBar] implementation of the [gid.gtk4.buildable.Buildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a `<child>` element, or setting the center widget
    by specifying “center” value.
    
    # CSS nodes
    
    ```
    actionbar
    ╰── revealer
        ╰── box
            ├── box.start
            │   ╰── [start children]
            ├── [center widget]
            ╰── box.end
                ╰── [end children]
    ```
    
    A [gid.gtk4.action_bar.ActionBar]'s CSS node is called `actionbar`. It contains a `revealer`
    subnode, which contains a `box` subnode, which contains two `box` subnodes at
    the start and end of the action bar, with `start` and `end` style classes
    respectively, as well as a center node that represents the center child.
    
    Each of the boxes contains children packed for that side.
*/
class ActionBar : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_action_bar_get_type != &gidSymbolNotFound ? gtk_action_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkActionBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.action_bar.ActionBar]
      Returns: New builder object
  */
  static ActionBarGidBuilder builder() nothrow
  {
    return new ActionBarGidBuilder;
  }

  /**
      Get `revealed` property.
      Returns: Controls whether the action bar shows its contents.
  */
  @property bool revealed() nothrow
  {
    return getRevealed();
  }

  /**
      Set `revealed` property.
      Params:
        propval = Controls whether the action bar shows its contents.
  */
  @property void revealed(bool propval) nothrow
  {
    setRevealed(propval);
  }

  /**
      Creates a new action bar widget.
      Returns: a new [gid.gtk4.action_bar.ActionBar]
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
      _cretval = gtk_action_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the center bar widget of the bar.
      Returns: the center widget
  */
  gid.gtk4.widget.Widget getCenterWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_get_center_widget(cast(GtkActionBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the contents of the action bar are revealed.
      Returns: the current value of the [gid.gtk4.action_bar.ActionBar.revealed]
          property
  */
  bool getRevealed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_action_bar_get_revealed(cast(GtkActionBar*)this._cPtr);
    return _retval;
  }

  /**
      Adds a child to the action bar, packed with reference to the
      end of the action bar.
  
      Params:
        child = the widget to be added
  */
  void packEnd(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_action_bar_pack_end(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds a child to the action, packed with reference to the
      start of the action bar.
  
      Params:
        child = the widget to be added
  */
  void packStart(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_action_bar_pack_start(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from the action bar.
  
      Params:
        child = the widget to be removed
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_action_bar_remove(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the center widget for the action bar.
  
      Params:
        centerWidget = a widget to use for the center
  */
  void setCenterWidget(gid.gtk4.widget.Widget centerWidget = null) nothrow
  {
    gtk_action_bar_set_center_widget(cast(GtkActionBar*)this._cPtr, centerWidget ? cast(GtkWidget*)centerWidget._cPtr(No.Dup) : null);
  }

  /**
      Reveals or conceals the content of the action bar.
      
      Note: this does not show or hide the action bar in the
      [gid.gtk4.widget.Widget.visible] sense, so revealing has
      no effect if the action bar is hidden.
  
      Params:
        revealed = the new value for the property
  */
  void setRevealed(bool revealed) nothrow
  {
    gtk_action_bar_set_revealed(cast(GtkActionBar*)this._cPtr, revealed);
  }
}

/// Fluent builder implementation template for [gid.gtk4.action_bar.ActionBar]
class ActionBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `revealed` property.
      Params:
        propval = Controls whether the action bar shows its contents.
      Returns: Builder instance for fluent chaining
  */
  T revealed(bool propval) nothrow
  {
    return setProperty("revealed", propval);
  }
}

/// Fluent builder for [gid.gtk4.action_bar.ActionBar]
final class ActionBarGidBuilder : ActionBarGidBuilderImpl!ActionBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ActionBar build() nothrow
  {
    return new ActionBar(cast(void*)createGObject(ActionBar._getGType), Yes.Take);
  }
}
