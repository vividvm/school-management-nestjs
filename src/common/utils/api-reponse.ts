export class ApiResponse<T> {
  constructor(
    public success: boolean,
    public message: string,
    public statusCode: number,
    public data: T | null,
  ) {}

  static success<T>(
    data: T,
    message = 'Request processed successfully',
    statusCode = 200,
  ): ApiResponse<T> {
    return new ApiResponse<T>(true, message, statusCode, data);
  }

  static failure<T>(message: string, statusCode = 400): ApiResponse<T> {
    return new ApiResponse<T>(false, message, statusCode, null);
  }
}
