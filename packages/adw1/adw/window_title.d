/// Module for [WindowTitle] class
module adw.window_title;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A helper widget for setting a window's title and subtitle.
    
    <picture>
      <source srcset="window-title-dark.png" media="(prefers-color-scheme: dark)">
      <img src="window-title.png" alt="window-title">
    </picture>
    
    [adw.window_title.WindowTitle] shows a title and subtitle. It's intended to be used as the
    title child of [gtk.header_bar.HeaderBar] or `class@HeaderBar`.
    
    ## CSS nodes
    
    [adw.window_title.WindowTitle] has a single CSS node with name `windowtitle`.
*/
class WindowTitle : gtk.widget.Widget
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
    return cast(void function())adw_window_title_get_type != &gidSymbolNotFound ? adw_window_title_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowTitle self()
  {
    return this;
  }

  /**
      Get builder for [adw.window_title.WindowTitle]
      Returns: New builder object
  */
  static WindowTitleGidBuilder builder()
  {
    return new WindowTitleGidBuilder;
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle to display.
        
        The subtitle should give the user additional details.
  */
  @property string subtitle()
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle to display.
          
          The subtitle should give the user additional details.
  */
  @property void subtitle(string propval)
  {
    setSubtitle(propval);
  }

  /**
      Get `title` property.
      Returns: The title to display.
        
        The title typically identifies the current view or content item, and
        generally does not use the application name.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title to display.
          
          The title typically identifies the current view or content item, and
          generally does not use the application name.
  */
  @property void title(string propval)
  {
    setTitle(propval);
  }

  /**
      Creates a new [adw.window_title.WindowTitle].
  
      Params:
        title = a title
        subtitle = a subtitle
      Returns: the newly created [adw.window_title.WindowTitle]
  */
  this(string title, string subtitle)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    _cretval = adw_window_title_new(_title, _subtitle);
    this(_cretval, No.Take);
  }

  /**
      Gets the subtitle of self.
      Returns: the subtitle
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = adw_window_title_get_subtitle(cast(AdwWindowTitle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_window_title_get_title(cast(AdwWindowTitle*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the subtitle of self.
      
      The subtitle should give the user additional details.
  
      Params:
        subtitle = a subtitle
  */
  void setSubtitle(string subtitle)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    adw_window_title_set_subtitle(cast(AdwWindowTitle*)this._cPtr, _subtitle);
  }

  /**
      Sets the title of self.
      
      The title typically identifies the current view or content item, and
      generally does not use the application name.
  
      Params:
        title = a title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_window_title_set_title(cast(AdwWindowTitle*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [adw.window_title.WindowTitle]
class WindowTitleGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle to display.
          
          The subtitle should give the user additional details.
      Returns: Builder instance for fluent chaining
  */
  T subtitle(string propval)
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title to display.
          
          The title typically identifies the current view or content item, and
          generally does not use the application name.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval)
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [adw.window_title.WindowTitle]
final class WindowTitleGidBuilder : WindowTitleGidBuilderImpl!WindowTitleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowTitle build()
  {
    return new WindowTitle(cast(void*)createGObject(WindowTitle._getGType), No.Take);
  }
}
