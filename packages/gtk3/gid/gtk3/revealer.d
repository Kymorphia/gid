/// Module for [Revealer] class
module gid.gtk3.revealer;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    The GtkRevealer widget is a container which animates
    the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gid.gtk4.revealer.Revealer.setTransitionType].
    
    These animations respect the #GtkSettings:gtk-enable-animations
    setting.
    
    # CSS nodes
    
    GtkRevealer has a single CSS node with name revealer.
    
    The GtkRevealer widget was added in GTK+ 3.10.
*/
@gidGir("Revealer", "RevealerClass")
class Revealer : gid.gtk3.bin.Bin
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
      Get builder for [gid.gtk3.revealer.Revealer]
      Returns: New builder object
  */
  static RevealerGidBuilder builder() nothrow
  {
    return new RevealerGidBuilder;
  }

  /** */
  @property bool childRevealed() nothrow
  {
    return getChildRevealed();
  }

  /** */
  @property bool revealChild() nothrow
  {
    return getRevealChild();
  }

  /** */
  @property void revealChild(bool propval) nothrow
  {
    setRevealChild(propval);
  }

  /** */
  @property uint transitionDuration() nothrow
  {
    return getTransitionDuration();
  }

  /** */
  @property void transitionDuration(uint propval) nothrow
  {
    setTransitionDuration(propval);
  }

  /** */
  @property gid.gtk3.types.RevealerTransitionType transitionType() nothrow
  {
    return getTransitionType();
  }

  /** */
  @property void transitionType(gid.gtk3.types.RevealerTransitionType propval) nothrow
  {
    setTransitionType(propval);
  }

  /**
      Creates a new #GtkRevealer.
      Returns: a newly created #GtkRevealer
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
      _cretval = gtk_revealer_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether the child is fully revealed, in other words whether
      the transition to the revealed state is completed.
      Returns: true if the child is fully revealed
  */
  bool getChildRevealed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_revealer_get_child_revealed(cast(GtkRevealer*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently
      revealed. See [gid.gtk4.revealer.Revealer.setRevealChild].
      
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
  gid.gtk3.types.RevealerTransitionType getTransitionType() nothrow
  {
    GtkRevealerTransitionType _cretval;
    _cretval = gtk_revealer_get_transition_type(cast(GtkRevealer*)this._cPtr);
    gid.gtk3.types.RevealerTransitionType _retval = cast(gid.gtk3.types.RevealerTransitionType)_cretval;
    return _retval;
  }

  /**
      Tells the #GtkRevealer to reveal or conceal its child.
      
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
      transitions in revealer. Available types include
      various kinds of fades and slides.
  
      Params:
        transition = the new transition type
  */
  void setTransitionType(gid.gtk3.types.RevealerTransitionType transition) nothrow
  {
    gtk_revealer_set_transition_type(cast(GtkRevealer*)this._cPtr, transition);
  }
}

/// Fluent builder implementation template for [gid.gtk3.revealer.Revealer]
class RevealerGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{


  /** */
  T revealChild(bool propval) nothrow
  {
    return setProperty("reveal-child", propval);
  }

  /** */
  T transitionDuration(uint propval) nothrow
  {
    return setProperty("transition-duration", propval);
  }

  /** */
  T transitionType(gid.gtk3.types.RevealerTransitionType propval) nothrow
  {
    return setProperty("transition-type", propval);
  }
}

/// Fluent builder for [gid.gtk3.revealer.Revealer]
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
