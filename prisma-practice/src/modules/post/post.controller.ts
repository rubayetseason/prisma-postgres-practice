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
      total: result.total,
      data: result.data,
    });
  } catch (err) {
    res.send(err);
  }
};

const updatePost = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const data = req.body;
  try {
    const result = await PostService.updatePost(id, data);
    res.send({
      success: true,
      message: "Post updated Successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

const deletePost = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  try {
    const result = await PostService.deletePost(id);
    res.send({
      success: true,
      message: "Post deleted Successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

export const PostController = {
  createPost,
  getAllPosts,
  updatePost,
  deletePost,
};
