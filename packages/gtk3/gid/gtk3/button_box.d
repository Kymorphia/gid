/// Module for [ButtonBox] class
module gid.gtk3.button_box;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class ButtonBox : gid.gtk3.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_button_box_get_type != &gidSymbolNotFound ? gtk_button_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkButtonBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override ButtonBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.button_box.ButtonBox]
      Returns: New builder object
  */
  static ButtonBoxGidBuilder builder() nothrow
  {
    return new ButtonBoxGidBuilder;
  }

  /** */
  @property gid.gtk3.types.ButtonBoxStyle layoutStyle() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ButtonBoxStyle)("layout-style");
  }

  /** */
  @property void layoutStyle(gid.gtk3.types.ButtonBoxStyle propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ButtonBoxStyle)("layout-style", propval);
  }

  /**
      Creates a new #GtkButtonBox.
  
      Params:
        orientation = the box's orientation.
      Returns: a new #GtkButtonBox.
  */
  this(gid.gtk3.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_button_box_new(orientation);
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether the child is exempted from homogenous
      sizing.
  
      Params:
        child = a child of widget
      Returns: true if the child is not subject to homogenous sizing
  */
  bool getChildNonHomogeneous(gid.gtk3.widget.Widget child) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_box_get_child_non_homogeneous(cast(GtkButtonBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether child should appear in a secondary group of children.
  
      Params:
        child = a child of widget
      Returns: whether child should appear in a secondary group of children.
  */
  bool getChildSecondary(gid.gtk3.widget.Widget child) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_box_get_child_secondary(cast(GtkButtonBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the method being used to arrange the buttons in a button box.
      Returns: the method used to lay out buttons in widget.
  */
  gid.gtk3.types.ButtonBoxStyle getLayout() nothrow
  {
    GtkButtonBoxStyle _cretval;
    _cretval = gtk_button_box_get_layout(cast(GtkButtonBox*)this._cPtr);
    gid.gtk3.types.ButtonBoxStyle _retval = cast(gid.gtk3.types.ButtonBoxStyle)_cretval;
    return _retval;
  }

  /**
      Sets whether the child is exempted from homogeous sizing.
  
      Params:
        child = a child of widget
        nonHomogeneous = the new value
  */
  void setChildNonHomogeneous(gid.gtk3.widget.Widget child, bool nonHomogeneous) nothrow
  {
    gtk_button_box_set_child_non_homogeneous(cast(GtkButtonBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, nonHomogeneous);
  }

  /**
      Sets whether child should appear in a secondary group of children.
      A typical use of a secondary child is the help button in a dialog.
      
      This group appears after the other children if the style
      is [gid.gtk3.types.ButtonBoxStyle.Start], [gid.gtk3.types.ButtonBoxStyle.Spread] or
      [gid.gtk3.types.ButtonBoxStyle.Edge], and before the other children if the style
      is [gid.gtk3.types.ButtonBoxStyle.End]. For horizontal button boxes, the definition
      of before/after depends on direction of the widget (see
      [gid.gtk4.widget.Widget.setDirection]). If the style is [gid.gtk3.types.ButtonBoxStyle.Start]
      or [gid.gtk3.types.ButtonBoxStyle.End], then the secondary children are aligned at
      the other end of the button box from the main children. For the
      other styles, they appear immediately next to the main children.
  
      Params:
        child = a child of widget
        isSecondary = if true, the child appears in a secondary group of the
                         button box.
  */
  void setChildSecondary(gid.gtk3.widget.Widget child, bool isSecondary) nothrow
  {
    gtk_button_box_set_child_secondary(cast(GtkButtonBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, isSecondary);
  }

  /**
      Changes the way buttons are arranged in their container.
  
      Params:
        layoutStyle = the new layout style
  */
  void setLayout(gid.gtk3.types.ButtonBoxStyle layoutStyle) nothrow
  {
    gtk_button_box_set_layout(cast(GtkButtonBox*)this._cPtr, layoutStyle);
  }
}

/// Fluent builder implementation template for [gid.gtk3.button_box.ButtonBox]
class ButtonBoxGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /** */
  T layoutStyle(gid.gtk3.types.ButtonBoxStyle propval) nothrow
  {
    return setProperty("layout-style", propval);
  }
}

/// Fluent builder for [gid.gtk3.button_box.ButtonBox]
final class ButtonBoxGidBuilder : ButtonBoxGidBuilderImpl!ButtonBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ButtonBox build() nothrow
  {
    return new ButtonBox(cast(void*)createGObject(ButtonBox._getGType), Yes.Take);
  }
}
