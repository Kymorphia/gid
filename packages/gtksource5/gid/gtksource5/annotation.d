/// Module for [Annotation] class
module gid.gtksource5.annotation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Represents an annotation added to [gid.gtksource5.view.View], it has a [gid.gtksource5.annotation.Annotation.line] property,
    [gid.gtksource5.annotation.Annotation.description], icon and a style.
    
    It will be displayed always at the end of a line.
    
    If the style is GTK_SOURCE_ANNOTATION_STYLE_NONE it will use the same color as [gid.gtksource5.space_drawer.SpaceDrawer].
*/
class Annotation : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_annotation_get_type != &gidSymbolNotFound ? gtk_source_annotation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceAnnotation";
  }

  /** Returns `this`, for use in `with` statements. */
  override Annotation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.annotation.Annotation]
      Returns: New builder object
  */
  static AnnotationGidBuilder builder() nothrow
  {
    return new AnnotationGidBuilder;
  }

  /**
      Get `description` property.
      Returns: The text description displayed at [gid.gtksource5.annotation.Annotation.line]
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Get `icon` property.
      Returns: The icon displayed at [gid.gtksource5.annotation.Annotation.line]
        
        It will be displayed before the text description
  */
  @property gid.gio2.icon.Icon icon() nothrow
  {
    return getIcon();
  }

  /**
      Get `line` property.
      Returns: The line where to display the annotation
  */
  @property uint line() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("line");
  }

  /**
      Get `style` property.
      Returns: The style of the annotation
  */
  @property gid.gtksource5.types.AnnotationStyle style() nothrow
  {
    return getStyle();
  }

  /** */
  this(string description, gid.gio2.icon.Icon icon, int line, gid.gtksource5.types.AnnotationStyle style) nothrow
  {
    GtkSourceAnnotation* _cretval;
    const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_annotation_new(_description, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null, line, style);
    this(_cretval, Yes.Take);
  }

  /** */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_annotation_get_description(cast(GtkSourceAnnotation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_annotation_get_icon(cast(GtkSourceAnnotation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  int getLine() nothrow
  {
    int _retval;
    _retval = gtk_source_annotation_get_line(cast(GtkSourceAnnotation*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gtksource5.types.AnnotationStyle getStyle() nothrow
  {
    GtkSourceAnnotationStyle _cretval;
    _cretval = gtk_source_annotation_get_style(cast(GtkSourceAnnotation*)this._cPtr);
    gid.gtksource5.types.AnnotationStyle _retval = cast(gid.gtksource5.types.AnnotationStyle)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.annotation.Annotation]
class AnnotationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.annotation.Annotation]
final class AnnotationGidBuilder : AnnotationGidBuilderImpl!AnnotationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Annotation build() nothrow
  {
    return new Annotation(cast(void*)createGObject(Annotation._getGType), Yes.Take);
  }
}
