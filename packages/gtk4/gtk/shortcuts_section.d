/// Module for [ShortcutsSection] class
module gtk.shortcuts_section;

public import gid.basictypes;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.shortcuts_group;
import gtk.types;

/**
    A [gtk.shortcuts_section.ShortcutsSection] collects all the keyboard shortcuts and gestures
    for a major application mode.
    
    If your application needs multiple sections, you should give each
    section a unique [gtk.shortcuts_section.ShortcutsSection.sectionName] and
    a [gtk.shortcuts_section.ShortcutsSection.title] that can be shown in the
    section selector of the [gtk.shortcuts_window.ShortcutsWindow].
    
    The [gtk.shortcuts_section.ShortcutsSection.maxHeight] property can be used
    to influence how the groups in the section are distributed over pages
    and columns.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
    
    The recommended way to construct a [gtk.shortcuts_section.ShortcutsSection] is with
    [gtk.builder.Builder], by using the `<child>` tag to populate a
    [gtk.shortcuts_section.ShortcutsSection] with one or more [gtk.shortcuts_group.ShortcutsGroup]
    instances, which in turn contain one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
    objects.
    
    If you need to add a group programmatically, use
    [gtk.shortcuts_section.ShortcutsSection.addGroup].
*/
class ShortcutsSection : gtk.box.Box
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
    return cast(void function())gtk_shortcuts_section_get_type != &gidSymbolNotFound ? gtk_shortcuts_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsSection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.shortcuts_section.ShortcutsSection]
      Returns: New builder object
  */
  static ShortcutsSectionGidBuilder builder() nothrow
  {
    return new ShortcutsSectionGidBuilder;
  }

  /**
      Get `maxHeight` property.
      Returns: The maximum number of lines to allow per column.
        
        This property can be used to influence how the groups in this
        section are distributed across pages and columns. The default
        value of 15 should work in most cases.
  */
  @property uint maxHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("max-height");
  }

  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum number of lines to allow per column.
          
          This property can be used to influence how the groups in this
          section are distributed across pages and columns. The default
          value of 15 should work in most cases.
  */
  @property void maxHeight(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("max-height", propval);
  }

  /**
      Get `sectionName` property.
      Returns: A unique name to identify this section among the sections
        added to the [gtk.shortcuts_window.ShortcutsWindow].
        
        Setting the [gtk.shortcuts_window.ShortcutsWindow.sectionName] property
        to this string will make this section shown in the [gtk.shortcuts_window.ShortcutsWindow].
  */
  @property string sectionName() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("section-name");
  }

  /**
      Set `sectionName` property.
      Params:
        propval = A unique name to identify this section among the sections
          added to the [gtk.shortcuts_window.ShortcutsWindow].
          
          Setting the [gtk.shortcuts_window.ShortcutsWindow.sectionName] property
          to this string will make this section shown in the [gtk.shortcuts_window.ShortcutsWindow].
  */
  @property void sectionName(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("section-name", propval);
  }

  /**
      Get `title` property.
      Returns: The string to show in the section selector of the [gtk.shortcuts_window.ShortcutsWindow]
        for this section.
        
        If there is only one section, you don't need to set a title,
        since the section selector will not be shown in this case.
  */
  @property string title() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The string to show in the section selector of the [gtk.shortcuts_window.ShortcutsWindow]
          for this section.
          
          If there is only one section, you don't need to set a title,
          since the section selector will not be shown in this case.
  */
  @property void title(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Get `viewName` property.
      Returns: A view name to filter the groups in this section by.
        
        See [gtk.shortcuts_group.ShortcutsGroup.view].
        
        Applications are expected to use the
        [gtk.shortcuts_window.ShortcutsWindow.viewName] property
        for this purpose.
  */
  @property string viewName() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("view-name");
  }

  /**
      Set `viewName` property.
      Params:
        propval = A view name to filter the groups in this section by.
          
          See [gtk.shortcuts_group.ShortcutsGroup.view].
          
          Applications are expected to use the
          [gtk.shortcuts_window.ShortcutsWindow.viewName] property
          for this purpose.
  */
  @property void viewName(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("view-name", propval);
  }

  /**
      Adds a group to the shortcuts section.
      
      This is the programmatic equivalent to using [gtk.builder.Builder] and a
      `<child>` tag to add the child.
      
      Adding children with the [gtk.box.Box] API is not appropriate, as
      [gtk.shortcuts_section.ShortcutsSection] manages its children internally.
  
      Params:
        group = the [gtk.shortcuts_group.ShortcutsGroup] to add
  */
  void addGroup(gtk.shortcuts_group.ShortcutsGroup group) nothrow
  {
    gtk_shortcuts_section_add_group(cast(GtkShortcutsSection*)this._cPtr, group ? cast(GtkShortcutsGroup*)group._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ChangeCurrentPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int object, gtk.shortcuts_section.ShortcutsSection shortcutsSection)`
  
          `object`  (optional)
  
          `shortcutsSection` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChangeCurrentPage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.shortcuts_section.ShortcutsSection)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.shortcuts_section.ShortcutsSection.changeCurrentPage");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-current-page", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.shortcuts_section.ShortcutsSection]
class ShortcutsSectionGidBuilderImpl(T) : gtk.box.BoxGidBuilderImpl!T
{


  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum number of lines to allow per column.
          
          This property can be used to influence how the groups in this
          section are distributed across pages and columns. The default
          value of 15 should work in most cases.
      Returns: Builder instance for fluent chaining
  */
  T maxHeight(uint propval) nothrow
  {
    return setProperty("max-height", propval);
  }

  /**
      Set `sectionName` property.
      Params:
        propval = A unique name to identify this section among the sections
          added to the [gtk.shortcuts_window.ShortcutsWindow].
          
          Setting the [gtk.shortcuts_window.ShortcutsWindow.sectionName] property
          to this string will make this section shown in the [gtk.shortcuts_window.ShortcutsWindow].
      Returns: Builder instance for fluent chaining
  */
  T sectionName(string propval) nothrow
  {
    return setProperty("section-name", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The string to show in the section selector of the [gtk.shortcuts_window.ShortcutsWindow]
          for this section.
          
          If there is only one section, you don't need to set a title,
          since the section selector will not be shown in this case.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `viewName` property.
      Params:
        propval = A view name to filter the groups in this section by.
          
          See [gtk.shortcuts_group.ShortcutsGroup.view].
          
          Applications are expected to use the
          [gtk.shortcuts_window.ShortcutsWindow.viewName] property
          for this purpose.
      Returns: Builder instance for fluent chaining
  */
  T viewName(string propval) nothrow
  {
    return setProperty("view-name", propval);
  }
}

/// Fluent builder for [gtk.shortcuts_section.ShortcutsSection]
final class ShortcutsSectionGidBuilder : ShortcutsSectionGidBuilderImpl!ShortcutsSectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsSection build() nothrow
  {
    return new ShortcutsSection(cast(void*)createGObject(ShortcutsSection._getGType), No.Take);
  }
}
