import { Request, Response } from "express";
import { CategoryService } from "./category.services";

const createCategory = async (req: Request, res: Response) => {
  try {
    const result = await CategoryService.createCategory(req.body);
    res.send({
      success: true,
      message: "Category created successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

export const CategoryController = {
  createCategory,
};
