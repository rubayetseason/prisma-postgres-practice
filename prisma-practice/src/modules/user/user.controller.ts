import { Request, Response } from "express";
import { UserService } from "./user.services";

const createUser = async (req: Request, res: Response) => {
  try {
    const result = await UserService.createUser(req.body);
    res.send({
      success: true,
      message: "User created successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

const insertOrUpdateProfile = async (req: Request, res: Response) => {
  try {
    const result = await UserService.insertOrUpdateProfile(req.body);
    res.send({
      success: true,
      message: "Profile updated successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

const getUsers = async (req: Request, res: Response) => {
  try {
    const result = await UserService.getUsers();
    res.send({
      success: true,
      message: "Users retrived successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};
const getSingleUser = async (req: Request, res: Response) => {
  try {
    const result = await UserService.getSingleUser(Number(req.params.id));
    res.send({
      success: true,
      message: "Users retrived successfully",
      data: result,
    });
  } catch (err) {
    res.send(err);
  }
};

export const UserController = {
  createUser,
  insertOrUpdateProfile,
  getUsers,
  getSingleUser,
};
