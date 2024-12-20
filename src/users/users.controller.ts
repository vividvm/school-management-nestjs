import {
  Controller,
  Get,
  Post,
  Param,
  Body,
  Put,
  Delete,
} from '@nestjs/common';
import { UserService } from './users.service';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  // Create a new user
  @Post()
  async createUser(
    @Body()
    userData: {
      firstName: string;
      lastName: string;
      middleName: string;
      username: string;
      passwordHash: string;
      email?: string;
      phone?: string;
      gender?: string;
    },
  ) {
    return this.userService.createUser(userData);
  }

  // Get a user by ID
  @Get(':id')
  async getUserById(@Param('id') id: string) {
    return this.userService.getUserById(id);
  }

  // Update a user
  @Put(':id')
  async updateUser(
    @Param('id') id: string,
    @Body()
    updateData: {
      firstName?: string;
      lastName?: string;
      email?: string;
      phone?: string;
    },
  ) {
    return this.userService.updateUser(id, updateData);
  }

  // Delete a user
  @Delete(':id')
  async deleteUser(@Param('id') id: string) {
    return this.userService.deleteUser(id);
  }
}
