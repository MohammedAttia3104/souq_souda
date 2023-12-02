import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/company_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_company_repository.dart';

class GetCompaniesUseCase
    extends BaseUseCase<List<CompanyEntity>, NoParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  GetCompaniesUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(
      NoParameters parameters) async {
    return await baseCompanyRepository.getCompanies();
  }
}
