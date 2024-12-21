import { Injectable } from '@nestjs/common';
import { UsersService } from './../users/users.service';

type AuthInput = { username: string; password: string };
type SignInData = { userId: string; username: string };
@Injectable()
export class AuthService {
  constructor(private usersService: UsersService) {}
  async validateUser(input: AuthInput): Promise<SignInData | null> {
    const user = await this.usersService.getAllUserById(input.username);
    if (user && user.passwordHash === input.password) {
      return {
        userId: user.id,
        username: user.username,
      };
    }
    return null;
  }
}
