import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
} from '@nestjs/common';
import { HttpException, HttpStatus } from '@nestjs/common';
import { catchError, map } from 'rxjs/operators';

import { ApiResponse } from '../utils/api-reponse';
import { Observable } from 'rxjs';

@Injectable()
export class TransformResponseInterceptor<T> implements NestInterceptor {
  intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Observable<ApiResponse<T>> {
    return next.handle().pipe(
      map((data) => {
        // Check if data is already an ApiResponse
        if (data instanceof ApiResponse) {
          return data;
        }
        return ApiResponse.success(data);
      }),
      catchError((error) => {
        const status =
          error instanceof HttpException
            ? error.getStatus()
            : HttpStatus.INTERNAL_SERVER_ERROR;
        const message = error.message || 'Internal server error';
        throw new HttpException(ApiResponse.failure(message, status), status);
      }),
    );
  }
}
