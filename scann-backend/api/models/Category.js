module.exports = {
  attributes: {
    createdAt: false,
    updatedAt: false,
    name: {
      type: "string",
      required: true,
    },

    items: {
      collection: "item",
      via: "category",
    },
  },
};
