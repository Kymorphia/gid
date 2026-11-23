/// Module for [Revealer] class
module gid.gtk4.revealer;

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
    Animates the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gid.gtk4.revealer.Revealer.setTransitionType].
    
    These animations respect the [gid.gtk4.settings.Settings.gtkEnableAnimations]
    setting.
    
    # CSS nodes
    
    [gid.gtk4.revealer.Revealer] has a single CSS node with name revealer.
    When styling [gid.gtk4.revealer.Revealer] using CSS, remember that it only hides its contents,
    not itself. That means applied margin, padding and borders will be visible even
    when the [gid.gtk4.revealer.Revealer.revealChild] property is set to false.
    
    # Accessibility
    
    [gid.gtk4.revealer.Revealer] uses the [gid.gtk4.types.AccessibleRole.Group] role.
    
    The child of [gid.gtk4.revealer.Revealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget.
*/
class Revealer : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_revealer_get_type != &gidSymbolNotFound ? gtk_revealer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRevealer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Revealer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.revealer.Revealer]
      Returns: New builder object
  */
  static RevealerGidBuilder builder() nothrow
  {
    return new RevealerGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `childRevealed` property.
      Returns: Whether the child is revealed and the animation target reached.
  */
  @property bool childRevealed() nothrow
  {
    return getChildRevealed();
  }

  /**
      Get `revealChild` property.
      Returns: Whether the revealer should reveal the child.
  */
  @property bool revealChild() nothrow
  {
    return getRevealChild();
  }

  /**
      Set `revealChild` property.
      Params:
        propval = Whether the revealer should reveal the child.
  */
  @property void revealChild(bool propval) nothrow
  {
    setRevealChild(propval);
  }

  /**
      Get `transitionDuration` property.
      Returns: The animation duration, in milliseconds.
  */
  @property uint transitionDuration() nothrow
  {
    return getTransitionDuration();
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The animation duration, in milliseconds.
  */
  @property void transitionDuration(uint propval) nothrow
  {
    setTransitionDuration(propval);
  }

  /**
      Get `transitionType` property.
      Returns: The type of animation used to transition.
  */
  @property gid.gtk4.types.RevealerTransitionType transitionType() nothrow
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used to transition.
  */
  @property void transitionType(gid.gtk4.types.RevealerTransitionType propval) nothrow
  {
    setTransitionType(propval);
  }

  /**
      Creates a new [gid.gtk4.revealer.Revealer].
      Returns: a newly created [gid.gtk4.revealer.Revealer]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_revealer_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the child widget of revealer.
      Returns: the child widget of revealer
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_revealer_get_child(cast(GtkRevealer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the child is fully revealed.
      
      In other words, this returns whether the transition
      to the revealed state is completed.
      Returns: true if the child is fully revealed
  */
  bool getChildRevealed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_child_revealed(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently revealed.
      
      This function returns true as soon as the transition
      is to the revealed state is started. To learn whether
      the child is fully revealed (ie the transition is completed),
      use [gid.gtk4.revealer.Revealer.getChildRevealed].
      Returns: true if the child is revealed.
  */
  bool getRevealChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_reveal_child(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the amount of time (in milliseconds) that
      transitions will take.
      Returns: the transition duration
  */
  uint getTransitionDuration() nothrow
  {
    uint _retval;
    _retval = gtk_revealer_get_transition_duration(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of animation that will be used
      for transitions in revealer.
      Returns: the current transition type of revealer
  */
  gid.gtk4.types.RevealerTransitionType getTransitionType() nothrow
  {
    GtkRevealerTransitionType _cretval;
    _cretval = gtk_revealer_get_transition_type(cast(GtkRevealer*)this._cPtr);
    gid.gtk4.types.RevealerTransitionType _retval = cast(gid.gtk4.types.RevealerTransitionType)_cretval;
    return _retval;
  }

  /**
      Sets the child widget of revealer.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_revealer_set_child(cast(GtkRevealer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Tells the [gid.gtk4.revealer.Revealer] to reveal or conceal its child.
      
      The transition will be animated with the current
      transition type of revealer.
  
      Params:
        revealChild = true to reveal the child
  */
  void setRevealChild(bool revealChild) nothrow
  {
    gtk_revealer_set_reveal_child(cast(GtkRevealer*)this._cPtr, revealChild);
  }

  /**
      Sets the duration that transitions will take.
  
      Params:
        duration = the new duration, in milliseconds
  */
  void setTransitionDuration(uint duration) nothrow
  {
    gtk_revealer_set_transition_duration(cast(GtkRevealer*)this._cPtr, duration);
  }

  /**
      Sets the type of animation that will be used for
      transitions in revealer.
      
      Available types include various kinds of fades and slides.
  
      Params:
        transition = the new transition type
  */
  void setTransitionType(gid.gtk4.types.RevealerTransitionType transition) nothrow
  {
    gtk_revealer_set_transition_type(cast(GtkRevealer*)this._cPtr, transition);
  }
}

/// Fluent builder implementation template for [gid.gtk4.revealer.Revealer]
class RevealerGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `revealChild` property.
      Params:
        propval = Whether the revealer should reveal the child.
      Returns: Builder instance for fluent chaining
  */
  T revealChild(bool propval) nothrow
  {
    return setProperty("reveal-child", propval);
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The animation duration, in milliseconds.
      Returns: Builder instance for fluent chaining
  */
  T transitionDuration(uint propval) nothrow
  {
    return setProperty("transition-duration", propval);
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used to transition.
      Returns: Builder instance for fluent chaining
  */
  T transitionType(gid.gtk4.types.RevealerTransitionType propval) nothrow
  {
    return setProperty("transition-type", propval);
  }
}

/// Fluent builder for [gid.gtk4.revealer.Revealer]
final class RevealerGidBuilder : RevealerGidBuilderImpl!RevealerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Revealer build() nothrow
  {
    return new Revealer(cast(void*)createGObject(Revealer._getGType), Yes.Take);
  }
}
