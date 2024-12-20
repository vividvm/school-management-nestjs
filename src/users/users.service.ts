import { PrismaClient, user } from '@prisma/client';

import { Injectable } from '@nestjs/common';

@Injectable()
export class UserService {
  private prisma = new PrismaClient();

  // Create a new user
  async createUser(data: {
    firstName: string;
    lastName: string;
    middleName: string;
    username: string;
    passwordHash: string;
    email?: string;
    phone?: string;
    gender?: string;
  }): Promise<user> {
    try {
      return await this.prisma.user.create({
        data,
      });
    } catch (error) {
      throw new Error('Error creating user: ' + error.message);
    }
  }

  // Get a user by ID
  async getUserById(id: string): Promise<user | null> {
    try {
      return await this.prisma.user.findUnique({
        where: { id },
      });
    } catch (error) {
      throw new Error('Error fetching user: ' + error.message);
    }
  }

  // Update a user
  async updateUser(
    id: string,
    data: {
      firstName?: string;
      lastName?: string;
      email?: string;
      phone?: string;
    },
  ): Promise<user> {
    try {
      return await this.prisma.user.update({
        where: { id },
        data,
      });
    } catch (error) {
      throw new Error('Error updating user: ' + error.message);
    }
  }

  // Delete a user
  async deleteUser(id: string): Promise<void> {
    try {
      await this.prisma.user.delete({
        where: { id },
      });
    } catch (error) {
      throw new Error('Error deleting user: ' + error.message);
    }
  }
}
