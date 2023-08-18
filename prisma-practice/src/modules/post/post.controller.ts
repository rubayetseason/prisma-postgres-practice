import { Request, Response } from "express";
import { PostService } from "./post.services";

const createPost = async (req: Request, res: Response) => {
  try {
    const result = await PostService.createPost(req.body);
    res.send({
      success: true,
      message: "Post Created Successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

const getAllPosts = async (req: Request, res: Response) => {
  try {
    const options = req.query;
    const result = await PostService.getAllPosts(options);
    res.send({
      success: true,
      message: "Posts retrived Successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

export const PostController = {
  createPost,
  getAllPosts,
};
