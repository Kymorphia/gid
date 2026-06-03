/// Module for [CommandDescriptor] class
module arrowflight.command_descriptor;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;

/** */
class CommandDescriptor : arrowflight.descriptor.Descriptor
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
    return cast(void function())gaflight_command_descriptor_get_type != &gidSymbolNotFound ? gaflight_command_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CommandDescriptor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.command_descriptor.CommandDescriptor]
      Returns: New builder object
  */
  static CommandDescriptorGidBuilder builder() nothrow
  {
    return new CommandDescriptorGidBuilder;
  }

  /** */
  this(string command) nothrow
  {
    GAFlightCommandDescriptor* _cretval;
    const(char)* _command = command.toCString!(No.Malloc, No.Nullable);
    _cretval = gaflight_command_descriptor_new(_command);
    this(_cretval, Yes.Take);
  }

  /** */
  string getCommand() nothrow
  {
    char* _cretval;
    _cretval = gaflight_command_descriptor_get_command(cast(GAFlightCommandDescriptor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.command_descriptor.CommandDescriptor]
class CommandDescriptorGidBuilderImpl(T) : arrowflight.descriptor.DescriptorGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.command_descriptor.CommandDescriptor]
final class CommandDescriptorGidBuilder : CommandDescriptorGidBuilderImpl!CommandDescriptorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CommandDescriptor build() nothrow
  {
    return new CommandDescriptor(cast(void*)createGObject(CommandDescriptor._getGType), Yes.Take);
  }
}
