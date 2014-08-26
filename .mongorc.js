DBCollection.prototype.findById = function (id) {
	return this.find({_id: ObjectId(id)}).toArray()[0]
};
