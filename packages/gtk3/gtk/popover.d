/// Module for [Popover] class
module gtk.popover;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.rectangle;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    GtkPopover is a bubble-like context window, primarily meant to
    provide context-dependent information or options. Popovers are
    attached to a widget, passed at construction time on [gtk.popover.Popover.new_],
    or updated afterwards through [gtk.popover.Popover.setRelativeTo], by
    default they will point to the whole widget area, although this
    behavior can be changed through [gtk.popover.Popover.setPointingTo].
    
    The position of a popover relative to the widget it is attached to
    can also be changed through [gtk.popover.Popover.setPosition].
    
    By default, #GtkPopover performs a GTK+ grab, in order to ensure
    input events get redirected to it while it is shown, and also so
    the popover is dismissed in the expected situations (clicks outside
    the popover, or the Esc key being pressed). If no such modal behavior
    is desired on a popover, [gtk.popover.Popover.setModal] may be called on it
    to tweak its behavior.
    
    ## GtkPopover as menu replacement
    
    GtkPopover is often used to replace menus. To facilitate this, it
    supports being populated from a #GMenuModel, using
    [gtk.popover.Popover.newFromModel]. In addition to all the regular menu
    model features, this function supports rendering sections in the
    model in a more compact form, as a row of icon buttons instead of
    menu items.
    
    To use this rendering, set the ”display-hint” attribute of the
    section to ”horizontal-buttons” and set the icons of your items
    with the ”verb-icon” attribute.
    
    ```
    <section>
      <attribute name="display-hint">horizontal-buttons</attribute>
      <item>
        <attribute name="label">Cut</attribute>
        <attribute name="action">app.cut</attribute>
        <attribute name="verb-icon">edit-cut-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Copy</attribute>
        <attribute name="action">app.copy</attribute>
        <attribute name="verb-icon">edit-copy-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Paste</attribute>
        <attribute name="action">app.paste</attribute>
        <attribute name="verb-icon">edit-paste-symbolic</attribute>
      </item>
    </section>
    ```
    
    # CSS nodes
    
    GtkPopover has a single css node called popover. It always gets the
    .background style class and it gets the .menu style class if it is
    menu-like (e.g. #GtkPopoverMenu or created using [gtk.popover.Popover.newFromModel].
    
    Particular uses of GtkPopover, such as touch selection popups
    or magnifiers in #GtkEntry or #GtkTextView get style classes
    like .touch-selection or .magnifier to differentiate from
    plain popovers.
*/
class Popover : gtk.bin.Bin
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
    return cast(void function())gtk_popover_get_type != &gidSymbolNotFound ? gtk_popover_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Popover self()
  {
    return this;
  }

  /**
      Get `constrainTo` property.
      Returns: Sets a constraint for the popover position.
  */
  @property gtk.types.PopoverConstraint constrainTo()
  {
    return getConstrainTo();
  }

  /**
      Set `constrainTo` property.
      Params:
        propval = Sets a constraint for the popover position.
  */
  @property void constrainTo(gtk.types.PopoverConstraint propval)
  {
    return setConstrainTo(propval);
  }

  /**
      Get `modal` property.
      Returns: Sets whether the popover is modal (so other elements in the window do not
      receive input while the popover is visible).
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Sets whether the popover is modal (so other elements in the window do not
        receive input while the popover is visible).
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `pointingTo` property.
      Returns: Marks a specific rectangle to be pointed.
  */
  @property gdk.rectangle.Rectangle pointingTo()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rectangle.Rectangle)("pointing-to");
  }

  /**
      Set `pointingTo` property.
      Params:
        propval = Marks a specific rectangle to be pointed.
  */
  @property void pointingTo(gdk.rectangle.Rectangle propval)
  {
    return setPointingTo(propval);
  }

  /**
      Get `position` property.
      Returns: Sets the preferred position of the popover.
  */
  @property gtk.types.PositionType position()
  {
    return getPosition();
  }

  /**
      Set `position` property.
      Params:
        propval = Sets the preferred position of the popover.
  */
  @property void position(gtk.types.PositionType propval)
  {
    return setPosition(propval);
  }

  /**
      Get `relativeTo` property.
      Returns: Sets the attached widget.
  */
  @property gtk.widget.Widget relativeTo()
  {
    return getRelativeTo();
  }

  /**
      Set `relativeTo` property.
      Params:
        propval = Sets the attached widget.
  */
  @property void relativeTo(gtk.widget.Widget propval)
  {
    return setRelativeTo(propval);
  }

  /**
      Get `transitionsEnabled` property.
      Returns: Whether show/hide transitions are enabled for this popover.
  
      Deprecated: You can show or hide the popover without transitions
        using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
        and [gtk.popover.Popover.popdown] will use transitions.
  */
  @property bool transitionsEnabled()
  {
    return getTransitionsEnabled();
  }

  /**
      Set `transitionsEnabled` property.
      Params:
        propval = Whether show/hide transitions are enabled for this popover.
  
      Deprecated: You can show or hide the popover without transitions
        using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
        and [gtk.popover.Popover.popdown] will use transitions.
  */
  @property void transitionsEnabled(bool propval)
  {
    return setTransitionsEnabled(propval);
  }

  /**
      Creates a new popover to point to relative_to
  
      Params:
        relativeTo = #GtkWidget the popover is related to
      Returns: a new #GtkPopover
  */
  this(gtk.widget.Widget relativeTo = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_new(relativeTo ? cast(GtkWidget*)relativeTo._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Creates a #GtkPopover and populates it according to
      model. The popover is pointed to the relative_to widget.
      
      The created buttons are connected to actions found in the
      #GtkApplicationWindow to which the popover belongs - typically
      by means of being attached to a widget that is contained within
      the #GtkApplicationWindows widget hierarchy.
      
      Actions can also be added using [gtk.widget.Widget.insertActionGroup]
      on the menus attach widget or on any of its parent widgets.
  
      Params:
        relativeTo = #GtkWidget the popover is related to
        model = a #GMenuModel
      Returns: the new #GtkPopover
  */
  static gtk.popover.Popover newFromModel(gtk.widget.Widget relativeTo, gio.menu_model.MenuModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_new_from_model(relativeTo ? cast(GtkWidget*)relativeTo._cPtr(No.Dup) : null, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover.Popover)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Establishes a binding between a #GtkPopover and a #GMenuModel.
      
      The contents of popover are removed and then refilled with menu items
      according to model.  When model changes, popover is updated.
      Calling this function twice on popover with different model will
      cause the first binding to be replaced with a binding to the new
      model. If model is null then any previous binding is undone and
      all children are removed.
      
      If action_namespace is non-null then the effect is as if all
      actions mentioned in the model have their names prefixed with the
      namespace, plus a dot.  For example, if the action “quit” is
      mentioned and action_namespace is “app” then the effective action
      name is “app.quit”.
      
      This function uses #GtkActionable to define the action name and
      target values on the created menu items.  If you want to use an
      action group other than “app” and “win”, or if you want to use a
      #GtkMenuShell outside of a #GtkApplicationWindow, then you will need
      to attach your own action group to the widget hierarchy using
      [gtk.widget.Widget.insertActionGroup].  As an example, if you created a
      group with a “quit” action and inserted it with the name “mygroup”
      then you would use the action name “mygroup.quit” in your
      #GMenuModel.
  
      Params:
        model = the #GMenuModel to bind to or null to remove
            binding
        actionNamespace = the namespace for actions in model
  */
  void bindModel(gio.menu_model.MenuModel model = null, string actionNamespace = null)
  {
    const(char)* _actionNamespace = actionNamespace.toCString(No.Alloc);
    gtk_popover_bind_model(cast(GtkPopover*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null, _actionNamespace);
  }

  /**
      Returns the constraint for placing this popover.
      See [gtk.popover.Popover.setConstrainTo].
      Returns: the constraint for placing this popover.
  */
  gtk.types.PopoverConstraint getConstrainTo()
  {
    GtkPopoverConstraint _cretval;
    _cretval = gtk_popover_get_constrain_to(cast(GtkPopover*)this._cPtr);
    gtk.types.PopoverConstraint _retval = cast(gtk.types.PopoverConstraint)_cretval;
    return _retval;
  }

  /**
      Gets the widget that should be set as the default while
      the popover is shown.
      Returns: the default widget,
        or null if there is none
  */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_get_default_widget(cast(GtkPopover*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the popover is modal, see gtk_popover_set_modal to
      see the implications of this.
      Returns: #TRUE if popover is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_modal(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      If a rectangle to point to has been set, this function will
      return true and fill in rect with such rectangle, otherwise
      it will return false and fill in rect with the attached
      widget width and height if a widget exists, otherwise it will zero-out rect.
  
      Params:
        rect = location to store the rectangle
      Returns: true if a rectangle to point to was set.
  */
  bool getPointingTo(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    GdkRectangle _rect;
    _retval = cast(bool)gtk_popover_get_pointing_to(cast(GtkPopover*)this._cPtr, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
    return _retval;
  }

  /**
      Returns the preferred position of popover.
      Returns: The preferred position.
  */
  gtk.types.PositionType getPosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_popover_get_position(cast(GtkPopover*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Returns the widget popover is currently attached to
      Returns: a #GtkWidget
  */
  gtk.widget.Widget getRelativeTo()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_get_relative_to(cast(GtkPopover*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether show/hide transitions are enabled on this popover.
      Returns: #TRUE if the show and hide transitions of the given
                 popover are enabled, #FALSE otherwise.
  
      Deprecated: You can show or hide the popover without transitions
          using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
          and [gtk.popover.Popover.popdown] will use transitions.
  */
  bool getTransitionsEnabled()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_transitions_enabled(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      Pops popover down.This is different than a [gtk.widget.Widget.hide] call
      in that it shows the popover with a transition. If you want to hide
      the popover without a transition, use [gtk.widget.Widget.hide].
  */
  void popdown()
  {
    gtk_popover_popdown(cast(GtkPopover*)this._cPtr);
  }

  /**
      Pops popover up. This is different than a [gtk.widget.Widget.show] call
      in that it shows the popover with a transition. If you want to show
      the popover without a transition, use [gtk.widget.Widget.show].
  */
  void popup()
  {
    gtk_popover_popup(cast(GtkPopover*)this._cPtr);
  }

  /**
      Sets a constraint for positioning this popover.
      
      Note that not all platforms support placing popovers freely,
      and may already impose constraints.
  
      Params:
        constraint = the new constraint
  */
  void setConstrainTo(gtk.types.PopoverConstraint constraint)
  {
    gtk_popover_set_constrain_to(cast(GtkPopover*)this._cPtr, constraint);
  }

  /**
      Sets the widget that should be set as default widget while
      the popover is shown (see [gtk.window.Window.setDefault]). #GtkPopover
      remembers the previous default widget and reestablishes it
      when the popover is dismissed.
  
      Params:
        widget = the new default widget, or null
  */
  void setDefaultWidget(gtk.widget.Widget widget = null)
  {
    gtk_popover_set_default_widget(cast(GtkPopover*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether popover is modal, a modal popover will grab all input
      within the toplevel and grab the keyboard focus on it when being
      displayed. Clicking outside the popover area or pressing Esc will
      dismiss the popover and ungrab input.
  
      Params:
        modal = #TRUE to make popover claim all input within the toplevel
  */
  void setModal(bool modal)
  {
    gtk_popover_set_modal(cast(GtkPopover*)this._cPtr, modal);
  }

  /**
      Sets the rectangle that popover will point to, in the
      coordinate space of the widget popover is attached to,
      see [gtk.popover.Popover.setRelativeTo].
  
      Params:
        rect = rectangle to point to
  */
  void setPointingTo(gdk.rectangle.Rectangle rect)
  {
    gtk_popover_set_pointing_to(cast(GtkPopover*)this._cPtr, rect ? cast(const(GdkRectangle)*)rect._cPtr(No.Dup) : null);
  }

  /**
      Sets the preferred position for popover to appear. If the popover
      is currently visible, it will be immediately updated.
      
      This preference will be respected where possible, although
      on lack of space (eg. if close to the window edges), the
      #GtkPopover may choose to appear on the opposite side
  
      Params:
        position = preferred popover position
  */
  void setPosition(gtk.types.PositionType position)
  {
    gtk_popover_set_position(cast(GtkPopover*)this._cPtr, position);
  }

  /**
      Sets a new widget to be attached to popover. If popover is
      visible, the position will be updated.
      
      Note: the ownership of popovers is always given to their relative_to
      widget, so if relative_to is set to null on an attached popover, it
      will be detached from its previous widget, and consequently destroyed
      unless extra references are kept.
  
      Params:
        relativeTo = a #GtkWidget
  */
  void setRelativeTo(gtk.widget.Widget relativeTo = null)
  {
    gtk_popover_set_relative_to(cast(GtkPopover*)this._cPtr, relativeTo ? cast(GtkWidget*)relativeTo._cPtr(No.Dup) : null);
  }

  /**
      Sets whether show/hide transitions are enabled on this popover
  
      Params:
        transitionsEnabled = Whether transitions are enabled
  
      Deprecated: You can show or hide the popover without transitions
          using [gtk.widget.Widget.show] and [gtk.widget.Widget.hide] while [gtk.popover.Popover.popup]
          and [gtk.popover.Popover.popdown] will use transitions.
  */
  void setTransitionsEnabled(bool transitionsEnabled)
  {
    gtk_popover_set_transitions_enabled(cast(GtkPopover*)this._cPtr, transitionsEnabled);
  }

  /**
      Connect to `Closed` signal.
  
      This signal is emitted when the popover is dismissed either through
      API or user interaction.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.popover.Popover popover))
  
          `popover` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.popover.Popover)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}
