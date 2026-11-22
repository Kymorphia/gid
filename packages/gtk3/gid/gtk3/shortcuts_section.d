/// Module for [ShortcutsSection] class
module gid.gtk3.shortcuts_section;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
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

/**
    A GtkShortcutsSection collects all the keyboard shortcuts and gestures
    for a major application mode. If your application needs multiple sections,
    you should give each section a unique #GtkShortcutsSection:section-name and
    a #GtkShortcutsSection:title that can be shown in the section selector of
    the GtkShortcutsWindow.
    
    The #GtkShortcutsSection:max-height property can be used to influence how
    the groups in the section are distributed over pages and columns.
    
    This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsSection : gid.gtk3.box.Box
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
    return cast(void function())gtk_shortcuts_section_get_type != &gidSymbolNotFound ? gtk_shortcuts_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutsSection";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsSection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.shortcuts_section.ShortcutsSection]
      Returns: New builder object
  */
  static ShortcutsSectionGidBuilder builder() nothrow
  {
    return new ShortcutsSectionGidBuilder;
  }

  /**
      Get `maxHeight` property.
      Returns: The maximum number of lines to allow per column. This property can
        be used to influence how the groups in this section are distributed
        across pages and columns. The default value of 15 should work in
        most cases.
  */
  @property uint maxHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("max-height");
  }

  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum number of lines to allow per column. This property can
          be used to influence how the groups in this section are distributed
          across pages and columns. The default value of 15 should work in
          most cases.
  */
  @property void maxHeight(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("max-height", propval);
  }

  /**
      Get `sectionName` property.
      Returns: A unique name to identify this section among the sections
        added to the GtkShortcutsWindow. Setting the #GtkShortcutsWindow:section-name
        property to this string will make this section shown in the
        GtkShortcutsWindow.
  */
  @property string sectionName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("section-name");
  }

  /**
      Set `sectionName` property.
      Params:
        propval = A unique name to identify this section among the sections
          added to the GtkShortcutsWindow. Setting the #GtkShortcutsWindow:section-name
          property to this string will make this section shown in the
          GtkShortcutsWindow.
  */
  @property void sectionName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("section-name", propval);
  }

  /**
      Get `title` property.
      Returns: The string to show in the section selector of the GtkShortcutsWindow
        for this section. If there is only one section, you don't need to
        set a title, since the section selector will not be shown in this case.
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The string to show in the section selector of the GtkShortcutsWindow
          for this section. If there is only one section, you don't need to
          set a title, since the section selector will not be shown in this case.
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Get `viewName` property.
      Returns: A view name to filter the groups in this section by.
        See #GtkShortcutsGroup:view.
        
        Applications are expected to use the #GtkShortcutsWindow:view-name
        property for this purpose.
  */
  @property string viewName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("view-name");
  }

  /**
      Set `viewName` property.
      Params:
        propval = A view name to filter the groups in this section by.
          See #GtkShortcutsGroup:view.
          
          Applications are expected to use the #GtkShortcutsWindow:view-name
          property for this purpose.
  */
  @property void viewName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("view-name", propval);
  }

  /**
      Connect to `ChangeCurrentPage` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int object, gid.gtk3.shortcuts_section.ShortcutsSection shortcutsSection)`
  
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
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.shortcuts_section.ShortcutsSection)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.shortcuts_section.ShortcutsSection.changeCurrentPage");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-current-page", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.shortcuts_section.ShortcutsSection]
class ShortcutsSectionGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum number of lines to allow per column. This property can
          be used to influence how the groups in this section are distributed
          across pages and columns. The default value of 15 should work in
          most cases.
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
          added to the GtkShortcutsWindow. Setting the #GtkShortcutsWindow:section-name
          property to this string will make this section shown in the
          GtkShortcutsWindow.
      Returns: Builder instance for fluent chaining
  */
  T sectionName(string propval) nothrow
  {
    return setProperty("section-name", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The string to show in the section selector of the GtkShortcutsWindow
          for this section. If there is only one section, you don't need to
          set a title, since the section selector will not be shown in this case.
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
          See #GtkShortcutsGroup:view.
          
          Applications are expected to use the #GtkShortcutsWindow:view-name
          property for this purpose.
      Returns: Builder instance for fluent chaining
  */
  T viewName(string propval) nothrow
  {
    return setProperty("view-name", propval);
  }
}

/// Fluent builder for [gid.gtk3.shortcuts_section.ShortcutsSection]
final class ShortcutsSectionGidBuilder : ShortcutsSectionGidBuilderImpl!ShortcutsSectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsSection build() nothrow
  {
    return new ShortcutsSection(cast(void*)createGObject(ShortcutsSection._getGType), Yes.Take);
  }
}
