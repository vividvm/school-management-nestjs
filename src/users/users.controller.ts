import { Body, Controller, Post, Get, Param } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  async createUser(@Body() userData: CreateUserDto) {
    return this.usersService.createUser(userData);
  }

  @Get()
  async getAllUser() {
    return this.usersService.getAllUser();
  }
  @Get(':id')
  async getAllUserById(@Param('id') id: string) {
    return this.usersService.getAllUserById(id);
  }
}
