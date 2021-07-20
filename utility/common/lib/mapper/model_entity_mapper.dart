part of common;

abstract class ModelEntityMapper<Model, Entity> {
	Entity mapFromModelToEntity(Model model);

	Model mapFromEntityToModel(Entity entity);
}
