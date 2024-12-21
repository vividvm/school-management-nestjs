import { PrismaClient, user } from '@prisma/client';

import { ApiResponse } from 'src/common/utils/api-reponse';
import { CreateUserDto } from './dto/create-user.dto';
import { Injectable } from '@nestjs/common';

@Injectable()
export class UsersService {
  private prisma = new PrismaClient();

  async createUser(createUserDto: CreateUserDto) {
    try {
      const user = await this.prisma.user.create({ data: createUserDto });
      return ApiResponse.success(user, 'User created successfully');
    } catch (error) {
      const errorMessage = error.message || 'Failed to create user';
      throw ApiResponse.failure(errorMessage, 400);
    }
  }

  async getAllUser() {
    try {
      return await this.prisma.user.findMany({
        where: {
          isActive: 1,
        },
      });
    } catch (error) {
      throw new Error('Error getting users:' + error.message);
    }
  }
  async getAllUserById(id: string): Promise<user | null> {
    try {
      return await this.prisma.user.findUnique({
        where: {
          isActive: 1,
          id,
        },
      });
    } catch (error) {
      throw new Error('Error getting users:' + error.message);
    }
  }
}
